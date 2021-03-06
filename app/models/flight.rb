class Flight < ApplicationRecord

  has_many :reservations

  def self.todos
    ActiveRecord::Base.connection.exec_query(
      'SELECT '\
        '* '\
      'FROM flights '\
      'ORDER BY flights.day, flights.departure_time'
    )
  end

  def self.algunos(origin, destination, from, to)
    ActiveRecord::Base.connection.exec_query(
      'SELECT '\
        '* '\
      'FROM flights '\
      "WHERE flights.origin = '#{origin}' "\
      "AND flights.destination = '#{destination}' "\
      "AND flights.day BETWEEN '#{from}' AND '#{to}' "\
      'ORDER BY flights.day, flights.departure_time'
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

  def self.uno_mejor(id)
    # connection = ActiveRecord::Base.connection
    sql =
      'SELECT '\
        '* '\
      'FROM flights '\
      "WHERE flights.id = '#{id}'"
    @result = Flight.find_by_sql(sql)[0]
  end
end
