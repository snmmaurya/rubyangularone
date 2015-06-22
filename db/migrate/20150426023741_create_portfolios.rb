class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|
    	t.string :title
    	t.string :image
    	t.string :url
    	t.string :tools    	
    	t.text :description
      t.belongs_to :user
      t.timestamps
    end
  end
end
