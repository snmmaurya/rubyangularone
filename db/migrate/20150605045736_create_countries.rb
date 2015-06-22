class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :title
      t.string :iso
      t.string :code
      t.string :currency
			t.string :capital
			t.string :language
			t.string :sex_ratio
			t.string :litracy
      t.string :population
      t.timestamps
    end
  end
end