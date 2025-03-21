class CreateReviews < ActiveRecord::Migration[8.0]
  def change
    create_table :reviews do |t|
      t.references :movie, null: false, foreign_key: true
      t.text :review_text
      t.float :rating

      t.timestamps
    end
  end
end
