class ChangeCloumnTypeCouponCode < ActiveRecord::Migration[7.0]
  def change
    change_column :coupons, :code, :string
  end
end
