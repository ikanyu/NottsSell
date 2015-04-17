class User < ActiveRecord::Base
  acts_as_messageable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products
  #has_many :offered_prices, through: :products

  def mailboxer_email(object)
 #return the model's email here
end
end
