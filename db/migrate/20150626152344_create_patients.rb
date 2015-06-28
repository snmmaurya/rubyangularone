class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.string :name
      t.string :email
      t.text :address
      t.string :problem
      t.text   :description
      t.timestamps
    end
  end
end
