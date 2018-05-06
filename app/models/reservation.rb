class Reservation < ApplicationRecord

  belongs_to :flight
  has_many :users, dependent: :destroy
  has_many :tickets, dependent: :destroy
  accepts_nested_attributes_for :users

  before_validation :assign_flight

  def assign_flight
    p "============="
    p @flight_id
  end

end
