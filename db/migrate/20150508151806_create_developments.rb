class CreateDevelopments < ActiveRecord::Migration
  def change
    create_table :developments do |t|
      t.string :title
      t.string :dev_type, default: :WEB #WEB|MOBILE
      t.belongs_to :user
    end
  end
end