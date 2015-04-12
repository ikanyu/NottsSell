class Product < ActiveRecord::Base
	mount_uploader :photo, PhotoUploader
	belongs_to :user
	attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
	after_update :crop_photo
	validates_presence_of :name, :description, :price, :photo, :offered_price

	def crop_photo
		photo.recreate_versions! if crop_x.present?
	end	
end

