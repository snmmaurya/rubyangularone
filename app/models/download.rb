class Download < ActiveRecord::Base
  belongs_to :user
  mount_uploader :download, FileUploader

  include Spreadsheet

  def self.initialize_background_download informations
    download = informations[:user].downloads.build(:filename => informations[:filename], :extension => informations[:extension])
    informations[:user]=nil
    informations[:filename]="#{Rails.root}/public/#{informations[:filename]}.#{informations[:extension]}"
    if download.save!
      DownloadWorker.perform_async(download.id, informations)
      # download.delay.start_create_upload informations
    end
  end

  def start_create_upload informations
    if informations["title"] == "Portfolio"
      create_file_for_portfolio informations
    end
    #upload file --- !#-- upload to cloudinary --#
    self.download = File.open(informations["filename"])
    self.ready_to_download = true
    self.save!
    # File::delete(informations["filename"])
  end

  def create_file_for_portfolio informations
    informations["header"] = ["Title", "URL", "Tools", "description"]
    book, sheet = create_spreadsheet informations
    portfolios = Portfolio.order(created_at: :desc)
    counter = 0
    if portfolios.present?
      portfolios.each do |portfolio|        
        sheet.row(counter=counter + 1).replace [portfolio.title, portfolio.url, portfolio.tools, portfolio.description]
      end
    else
      sheet.row(counter += 1).replace ["Portfolio not found!"]
    end
    book.write informations["filename"]
  end

  def create_spreadsheet informations   
    book = Spreadsheet::Workbook.new
    sheet = book.create_worksheet :name => informations["title"].to_s
    format = Spreadsheet::Format.new :weight => :bold
    sheet.row(0).replace informations["header"]
    sheet.row(0).default_format = format
    return book, sheet
  end
end