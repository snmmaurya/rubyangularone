class CreateTechnologies < ActiveRecord::Migration
  def change
    create_table :technologies do |t|
	  t.string :title
	  t.string :tech_type, default: :WEB #WEB|OTHER
	  t.belongs_to :user
    end
  end
end