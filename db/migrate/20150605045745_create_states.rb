class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
			t.string :title
			t.string :capital
			t.string :language
			t.string :sex_ratio
			t.string :litracy
			t.string :population
			t.belongs_to :country, index: true
			t.timestamps
    end
  end
end
