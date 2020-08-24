class TicketCategory < ApplicationRecord
  belongs_to :category
  belongs_to :ticket
end
