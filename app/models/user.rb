class User < ApplicationRecord

  belongs_to :reservation
  has_many :tickets


  validates :name, presence: true
  validates :last_name_p, presence: true
  validates :last_name_m, presence: true
  validates :mail, uniqueness: true,
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
    presence: true
  validates :telephone, presence: true
  validates :birth_date, presence: true
  validates :passport, uniqueness: true, presence: true

end
