class Donation < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  include EmailValidatable
  validates :title, presence: true
  validates :description, presence: true
  validates :phone,presence: true
  validates :email, presence: true, email: true
  validates_format_of :phone, :with => /^(\d\d)\d{9}$|^\(\d\d\)\d{8}$/, multiline: true
  validates_format_of :zip, with: /^\d{5}-\d{3}$/, multiline: true
  validate :image_type

  private
  def self.search(search)
    if search
      where(["title LIKE ?", "%#{search}%"])
    else
      all
    end
  end

  def image_type
    if images.attached?
      images.each do |image|
        if !image.content_type.in?(%('image/jpeg image/png'))
          errors.add(:images, ": Formato de imagem inválido. Permitido: JPEG ou PNG.")
        end
      end
    end
  end

end

