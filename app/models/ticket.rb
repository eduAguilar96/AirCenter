class Ticket < ApplicationRecord

  before_create :generate_id

  belongs_to :user
  belongs_to :flight

  private

  def generate_id
    self.id = SecureRandom.uuid
  end
end
