class User < ApplicationRecord

  belongs_to :reservation, optional: true
  has_many :tickets

  validates :name, presence: true
  validates :last_name_p, presence: true
  validates :mail, uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    presence: true
  validates :telephone, presence: true
  validates :birth_date, presence: true
  validates :passport, uniqueness: true, presence: true

  def self.algunos_por_vuelo(flight_id:)
    sql =
    'SELECT '\
    '* '\
    'FROM users '\
    'LEFT JOIN '\
    'reservations '\
    'ON '\
    'reservations.id = users.reservation_id '\
    "WHERE reservations.flight_id = '#{flight_id}'"
    @result = User.find_by_sql(sql)
  end

  def self.algunos_por_reserva(reservation_id:)
    # connection = ActiveRecord::Base.connection
    sql =
      'SELECT '\
        '* '\
      'FROM users '\
      "WHERE users.reservation_id = '#{reservation_id}'"
    @result = User.find_by_sql(sql)
  end

end
