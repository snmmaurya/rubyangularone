class CreateApis < ActiveRecord::Migration
  def change
    create_table :apis do |t|
    	t.string :title
    	t.belongs_to :user
    end
  end
end
