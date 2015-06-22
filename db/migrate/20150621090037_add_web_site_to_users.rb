class AddWebSiteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :web_site, :string, default: "http://www.snmmaurya.com"
  end
end
