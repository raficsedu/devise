class Ticket < ApplicationRecord
  has_many :ticket_loops
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  enum status: [ :open, :closed ]
end
