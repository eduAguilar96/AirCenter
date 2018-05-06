class User < ApplicationRecord

  has_many :reservation_informations
  has_many :tickets

  validates :mail, uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :passport, uniqueness: true

end
