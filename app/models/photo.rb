class Photo < ApplicationRecord
	#mount image
	mount_uploader :image, ImageUploader

	# Active Record Validationdat

	validates :title, length: {
		maximum: 140,
		presence: true,
		too_long: "maximum 140 characters long"
	}

	validates :description, length: {
		maximum: 300,
		presence: true,
		too_long: "maximum 300 characters long"
	}

	validates :sharing_mode, inclusion: {in: %w(public private)}, presence: true
	# Active Record Callback

	before_save :check_description

	def check_description
		unless description.present?
			self.description = "This is photo of user has id #{user_id}"
		end		
	end

	# Active Record Association

	belongs_to :user
	has_and_belongs_to_many :albums

	has_many :likes, as: :likeable
	
end