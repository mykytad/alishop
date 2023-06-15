class User < ApplicationRecord
  has_many :stores, :dependent => :destroy
  has_many :reviews
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  after_create do
    UserMailer.with(user: self).welcome_email.deliver_later
  end  
end
