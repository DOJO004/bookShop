class ChangeCloumnFromCouopns < ActiveRecord::Migration[7.0]
  def change
    remove_column :coupons, :amount, :integer
    add_column :coupons, :coupon_type, :string
  end
end
