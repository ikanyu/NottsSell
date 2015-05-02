class User < ActiveRecord::Base
  acts_as_messageable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :products

  validate :freeze_email, :on => :update

  attr_readonly :email

  validates_format_of :email, :with => (/\A([^@\s]+)@nottingham.edu.my\z/)
  #validates_format_of :email, :with => (/A^([^@\s]+)@(nottingham.edu.my)z/)
  #has_many :offered_prices, through: :products

  def mailboxer_email(object)
 #return the model's email here
  end

  protected

  def freeze_email
  		errors.add(:email, "cannot be changed") if self.email_changed?
  end	
end