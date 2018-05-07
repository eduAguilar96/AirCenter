class Ticket < ApplicationRecord

  belongs_to :user
  belongs_to :reservation

  def self.algunos(reservation_id)
    # connection = ActiveRecord::Base.connection
    sql =
      'SELECT '\
        '* '\
      'FROM tickets '\
      "WHERE tickets.reservation_id = '#{reservation_id}'"
    @result = Ticket.find_by_sql(sql)
  end
end
