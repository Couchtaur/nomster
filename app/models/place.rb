class Place < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :photos

	geocoded_by :address
	after_validation :geocode

	validates :name, presence: true, length: { minimum: 3 }
	validates :address, presence: true
	validates :description, presence: true

	def photo
		photos.first
	end
end
