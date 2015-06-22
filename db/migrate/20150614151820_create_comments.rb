class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.string :status, default: :ACTIVE
      t.belongs_to :comment, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
