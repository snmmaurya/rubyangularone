class AddCountryStateCityWebsiteToUser < ActiveRecord::Migration
  def change
  	add_column :infos, :state_id, :integer
  	add_column :infos, :country_id, :integer
  	add_column :infos, :city, :string
  end
end