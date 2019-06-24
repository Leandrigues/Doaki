class User < ApplicationRecord
	has_many :donations
	has_many :comments
	has_secure_password
    validates :email, presence: true, uniqueness: true
	validates :name, presence: true
	validates :password, :length => { :within => 6..40 }
end