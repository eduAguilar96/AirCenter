class Flight < ApplicationRecord

  before_create :generate_id

  has_many :reservation_informations

  def self.todos
    ActiveRecord::Base.connection.exec_query(
      'SELECT '\
        '* '\
      'FROM flights'
    )
  end

  def self.algunos(origin, destination, from, to)
    ActiveRecord::Base.connection.exec_query(
      'SELECT '\
        '* '\
      'FROM flights '\
      "WHERE flights.origin = '#{origin}' "\
      "AND flights.destination = '#{destination}' "\
      "AND flights.day BETWEEN '#{from}' AND '#{to}'"
    )
  end

  def self.uno(id)
    ActiveRecord::Base.connection.exec_query(
      'SELECT '\
        '* '\
      'FROM flights '\
      "WHERE flights.id = '#{id}'"
    )
  end

  private

  def generate_id
    self.id = SecureRandom.uuid
  end
end
