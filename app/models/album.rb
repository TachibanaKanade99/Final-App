class Album < ApplicationRecord
    # Image Uploader
    # mount_uploaders :images, ImageUploader

    # Pagination
    paginates_per 6

	# Active Record Validation

	validates :title, length: {
		maximum: 140,
		minimum: 10,
		presence: true,
		too_long: "maximum 140 characters long"
	}

	validates :description, length: {
		maximum: 300,
		allow_nil: true,
		too_long: "maximum 300 characters long"
	}

	validates :sharing_mode, inclusion: {in: %w(public private)}, presence: true

	# Active Record Callback

	before_save :check_description

	def check_description
		unless description.present?
			self.description = "This is album of user has id #{user_id}"
		end		
	end

	# Active Record Association

    belongs_to :user, counter_cache: true
    
	has_many :photos, dependent: :destroy
	has_many :likes, as: :likeable


end