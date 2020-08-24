class Ticket < ApplicationRecord
  belongs_to :mom, class_name: "User"
  belongs_to :helper, class_name: "User"
  has_many :ticket_categories
  has_many :categories, through: :ticket_categories
end
