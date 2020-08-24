class Category < ApplicationRecord
  has_many :ticket_categories
  has_many :tickets, through: :ticket_categories
end
