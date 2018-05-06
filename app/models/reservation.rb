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
  
end
