class User < ApplicationRecord

  has_many :reservation_informations
  has_many :tickets

  before_create :generate_id

  private

  def generate_id
    self.id = SecureRandom.uuid
  end
end
