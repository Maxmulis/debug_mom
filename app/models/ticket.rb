class Ticket < ApplicationRecord
  has_many_attached :photos
  belongs_to :mom, class_name: "User", optional: true
  belongs_to :helper, class_name: "User", optional: true
  has_many :ticket_categories
  has_many :categories, through: :ticket_categories
end
