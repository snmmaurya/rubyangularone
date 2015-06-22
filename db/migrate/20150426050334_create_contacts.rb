class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
    	t.string :name
    	t.string :email
    	t.string :contact
    	t.text   :message
    	t.string :status, default: :ACTIVE, length: 20
      t.timestamps
    end
  end
end
