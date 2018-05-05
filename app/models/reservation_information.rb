class ReservationInformation < ApplicationRecord

  before_create :generate_id
  belongs_to :flight
  belongs_to :user

  private

  def generate_id
    self.id = SecureRandom.uuid
  end
end
