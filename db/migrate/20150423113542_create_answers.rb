class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
    	t.text :answer
    	t.string :description
    	t.string :status, default: :ACTIVE, length: 20
      t.timestamps
      t.belongs_to :problem, index: true
      t.belongs_to :user, index: true      
    end
  end
end
