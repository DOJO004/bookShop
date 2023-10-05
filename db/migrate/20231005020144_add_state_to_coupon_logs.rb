class AddStateToCouponLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :coupon_logs, :state, :string, default: 'usable'
  end
end
