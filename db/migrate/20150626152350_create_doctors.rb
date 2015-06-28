class CreateDoctors < ActiveRecord::Migration
  def change
    create_table :doctors do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :practice
      t.text   :description
      t.timestamps
    end
  end
end