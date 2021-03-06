class User < ApplicationRecord
	# Devise modules
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :confirmable, :validatable, :timeoutable, :trackable
    
    def active_for_authentication?
        # Uncomment the below debug statement to view the properties of the returned self model values.
        # logger.debug self.to_yaml
        	
        super && self.active?
    end

	# Mount avatar
	mount_uploader :avatar, AvatarUploader

	# Callbacks
	after_create_commit :send_welcome_mail

	# Active Record Validation
	validates :first_name, :last_name, length: {
		maximum: 25,
		too_long: "maximum 25 characters long"
	},
	presence: true,
	format: { 
		with: /\A[a-zA-Z]+\z/,
		message: "only allows characters"
	}

	validates :email, length: {
		maximum: 255,
		too_long: "maximum 255 characters long"
	},
	presence: true,
	uniqueness: {
		case_sensitive: true,
		message: "this email has already been taken"
	},
	email: true # for validate email
	validates :password, length: {
		maximum: 64,
		too_long: "maximum 64 characters long"
	},
	presence: true

	# Active Record Association
	has_many :albums, dependent: :destroy
	has_many :photos, dependent: :destroy

	# Has many users follow me
	has_many :received_follows, foreign_key: :followed_user_id, class_name: "Follow"
	has_many :followers, through: :received_follows, source: :follower

	# Me follows many users
	has_many :given_follows, foreign_key: :follower_id, class_name: "Follow"
	has_many :followings, through: :given_follows, source: :followed_user

	# User has many likes
	has_many :likes, dependent: :destroy

	def send_welcome_mail
		UserMailer.with(user: self).welcome_email.deliver_now		
	end
	
end