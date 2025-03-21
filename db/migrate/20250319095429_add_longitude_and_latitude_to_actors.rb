class AddLongitudeAndLatitudeToActors < ActiveRecord::Migration[8.0]
  def change
    add_column :actors, :longitude, :float
    add_column :actors, :latitude, :float
  end
end
