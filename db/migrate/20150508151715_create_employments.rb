class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
    	t.string :role
    	t.string :company
    	t.text :description
    	t.string :status, default: :PREVIOUS
    	t.timestamp :joined_at
    	t.timestamp :leaved_at
    	t.belongs_to :user
    end
  end
end
