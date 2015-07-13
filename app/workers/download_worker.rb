class DownloadWorker
  include Sidekiq::Worker
  sidekiq_options queue: "high"

  def perform(download_id, informations)
    download = Download.find download_id
    download.start_create_upload informations
  end  
end