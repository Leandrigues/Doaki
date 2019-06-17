class User < ApplicationRecord
	has_many :donations
	has_secure_password
    validates :email, presence: true, uniqueness: true
end