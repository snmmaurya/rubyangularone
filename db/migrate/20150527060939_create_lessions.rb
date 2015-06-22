class CreateLessions < ActiveRecord::Migration
  def change
    create_table :lessions do |t|
    	t.string :title
    	t.text :description, limit: 16777215
    	t.belongs_to :book
      t.timestamps
    end
  end
end
