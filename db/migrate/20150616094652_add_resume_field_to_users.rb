class AddResumeFieldToUsers < ActiveRecord::Migration
  def change
    add_column :users, :resume_doc, :string
    add_column :users, :resume_pdf, :string
  end
end
