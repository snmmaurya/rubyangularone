class CreateDownloads < ActiveRecord::Migration
	def change
		create_table :downloads do |t|
			t.string :download
			t.string :filename
			t.string :extension
			t.boolean :ready_to_download, default: false
			t.belongs_to :user
			t.timestamps
		end
	end
end
