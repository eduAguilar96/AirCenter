class Flight < ApplicationRecord

  before_create :generate_id

  has_many :reservation_informations

  private

  def generate_id
    self.id = SecureRandom.uuid
  end
end
