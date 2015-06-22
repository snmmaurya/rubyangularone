class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
    	t.string :solution
    	t.string :description
    	t.string :image
    	t.string :status, default: :ACTIVE, length: 20
      t.timestamps
    end
  end
end
