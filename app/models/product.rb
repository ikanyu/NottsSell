class Product < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader
	#has_many :offered_price
	#has_many :user, through: :offered_prices
	belongs_to :user
	has_many :offers

	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
	after_update :crop_photo
	validates_presence_of :name, :description, :price, :photo

	def crop_photo
		photo.recreate_versions! if crop_x.present?
	end	
end

