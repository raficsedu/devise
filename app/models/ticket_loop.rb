class TicketLoop < ApplicationRecord
  belongs_to :ticket

  validates :description, presence: true
  enum role: [ :admin, :agent, :customer ]
end
