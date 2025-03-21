class RemoveReleaseYearFromMovies < ActiveRecord::Migration[8.0]
  def change
    remove_column :movies, :release_year, :integer
  end
end
