class User < ApplicationRecord
  has_many :clients
  has_many :invoices
  has_one_attached :logo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
