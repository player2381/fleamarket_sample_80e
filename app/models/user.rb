class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable

  validates :name, presence: true, uniqueness: { case_sensitive: true }
  validates :birth_date, presence: true
  has_one :address
  has_one :card
  has_many :productions
  has_many :likes, dependent: :destroy
  has_many :like_productions, through: :likes, source: :production
end
