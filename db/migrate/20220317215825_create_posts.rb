class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :category
      t.string :image_data
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
