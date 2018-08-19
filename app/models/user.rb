class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 order2
        belongs_to :carts
        has_many :items

  has_many :favorites
  has_many :items, through: :favorites

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :tel, presence: true, format: {with: /\A[0-9-]{,14}\z/}

 master
end
