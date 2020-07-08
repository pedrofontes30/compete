class Order < ApplicationRecord
  belongs_to :user
  belongs_to :registration, optional: true
  belongs_to :affiliation, optional: true
  monetize :amount_cents
end
