class User < ApplicationRecord

  has_many :reservation_informations
  has_many :tickets

end
