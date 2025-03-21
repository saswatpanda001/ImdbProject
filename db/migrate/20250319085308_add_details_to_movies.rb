class AddDetailsToMovies < ActiveRecord::Migration[8.0]
  def change
    add_column :movies, :budget, :decimal
    add_column :movies, :revenue, :decimal
    add_column :movies, :overview, :text
  end
end
