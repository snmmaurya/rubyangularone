class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
    	t.string     :title
    	t.string     :school
    	t.text       :description
    	t.string :status, default: :COMPLETED
    	t.timestamp  :started_at
    	t.timestamp  :completed_at
    	t.belongs_to :user
    end
  end
end
