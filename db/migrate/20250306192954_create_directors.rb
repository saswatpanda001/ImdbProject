class CreateDirectors < ActiveRecord::Migration[8.0]
  def change
    create_table :directors do |t|
      t.string :name
      t.integer :birth_year
      t.string :nationality

      t.timestamps
    end
  end
end
