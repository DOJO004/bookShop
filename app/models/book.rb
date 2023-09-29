class Book < ApplicationRecord
    validates :title, :author, :overview, :price, :stocks, :publish_date, presence: true
end
