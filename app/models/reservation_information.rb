class ReservationInformation < ApplicationRecord

  before_create :generate_id
  belongs_to :flight
  belongs_to :user

  private

  def generate_id
    self.id = SecureRandom.uuid
  end
  def self.uno(id)
    ActiveRecord::Base.connection.exec_query(
      'SELECT name FROM reservation_informations a JOIN
       users b WHERE  a.user_id = b.id '\
      "  AND id = '#{id}' "
    )
  end

end
