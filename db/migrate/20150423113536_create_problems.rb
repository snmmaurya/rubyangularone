class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
    	t.text :problem
    	t.string :description
    	t.string :status, default: :ACTIVE, length: 20
      t.belongs_to :solution, index: true
      t.belongs_to :user, index: true
      t.timestamps      
    end
  end
end
