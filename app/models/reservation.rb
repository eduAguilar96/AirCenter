class Reservation < ApplicationRecord

  belongs_to :flight
  has_many :users, dependent: :destroy
  accepts_nested_attributes_for :users,
    allow_destroy: true,
    reject_if: proc { |att|
      att['name'].blank? &&
      att['last_name_p'].blank? &&
      att['mail'].blank? &&
      att['telephone'].blank? &&
      att['birth_date'].blank? &&
      att['passport'].blank?
    }
  has_many :tickets, dependent: :destroy

  def self.uno(id)
    # connection = ActiveRecord::Base.connection
    sql =
      'SELECT '\
        '* '\
      'FROM reservations '\
      "WHERE reservations.id = '#{id}'"
    @result = Reservation.find_by_sql(sql)[0]
  end

  def build_tickets(users, reservation)
    tickets = []
    cost = 1000
    zone = (0...1).map { ('A'..'Z').to_a[rand(26)] }.join + rand(1..12).to_s
    seat_num = 1
    seat_letter = (0...1).map { ('A'..'Z').to_a[rand(26)] }.join
    seat_num = 1
    users.each do |user|
      tickets.push(
        {
          reservation_id: reservation.id,
          user_id: user.id,
          seat: seat_letter + seat_num.to_s,
          zone: zone,
          cost: cost
        }
      )
      seat_num += 1
    end
    tickets
  end
end
