class AddSlugToUserSolutionProblemAnswerBookLession < ActiveRecord::Migration
  def change
    add_column :users, :slug, :string, unique: true
    add_column :solutions, :slug, :string, unique: true
    add_column :problems, :slug, :string, unique: true
    add_column :answers, :slug, :string, unique: true
    add_column :books, :slug, :string, unique: true
    add_column :lessions, :slug, :string, unique: true
  end
end
