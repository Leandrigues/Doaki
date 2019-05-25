class Donation < ApplicationRecord
  has_many_attached :images
  include EmailValidatable
  validates :title, presence: true
  validates :description, presence: true
  validates :detail, presence: true
  validates :phone,presence: true
  validates :email, presence: true, email: true
  validates_format_of :phone, :with => /^(\d\d)\d{9}$|^\(\d\d\)\d{8}$/, multiline: true
  validates_format_of :zip, with: /^\d{5}-\d{3}$/, multiline: true
end
