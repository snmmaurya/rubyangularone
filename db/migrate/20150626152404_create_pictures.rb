class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :image
      t.references :picturable, polymorphic: true, index: true
    end
  end
end
