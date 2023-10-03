class CreateCoupons < ActiveRecord::Migration[7.0]
  def change
    create_table :coupons do |t|
      t.string :name
      t.integer :code
      t.integer :amount
      t.float :discount
      t.datetime :expiration_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
