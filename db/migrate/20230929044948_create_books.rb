class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :overview
      t.integer :price
      t.integer :stocks
      t.string :publisher
      t.date :publish_date
      t.string :isbn

      t.timestamps
    end
  end
end
