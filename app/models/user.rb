class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: true
  has_many :coupon_logs
  enum role: { client: 'client', admin: 'admin' }

  def usable_coupons
    coupon_logs.where(state: 'usable').includes(:coupon).map(&:coupon)
  end
end
