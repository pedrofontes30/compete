class Order < ApplicationRecord
  belongs_to :user
  belongs_to :registration
  monetize :amount_cents
end
