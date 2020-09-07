class User < ApplicationRecord
	# Devise modules
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :confirmable, :validatable, :timeoutable

	# Active Record Validation
	validates :first_name, :last_name, length: {
		maximum: 25,
		presence: true,
		too_long: "maximum 25 characters long"
	},
	format: { 
		with: /\A[a-zA-Z]+\z/,
		message: "only alows characters"
	}

	validates :email, length: {
		maximum: 255,
		presence: true,
		too_long: "maximum 255 characters long"
	},
	uniqueness: {
		case_sensitive: true,
		message: "this email has already been taken"
	},
	email: true # for validate email
	validates :password, length: {
		maximum: 64,
		presence: true,
		too_long: "maximum 64 characters long"
	}

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

end