class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.string :fname
    	t.string :lname
    	t.string :date_of_birth
    	t.string :contact
    	t.string :gender
    	t.text   :address
    	t.text   :about_yourself
    	t.string :martial_status
    	t.belongs_to :user, index: true
      t.timestamps
    end
  end
end
