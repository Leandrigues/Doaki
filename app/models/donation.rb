class Donation < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true
  validates :description, presence: true
  validates :detail, presence: true
  validates :phone,presence: true,numericality: true
  validates :email, presence: true
  validates_format_of :phone, :with => /^\(\d\d\)\d{9}$|^\(\d\d\)\d{8}$/, multiline: true
  validates_format_of :zip, with: /^\d{5}-\d{3}$/, multiline: true
  validates_format_of :email, with: /.+@.+\.com(\.br)?/
end
