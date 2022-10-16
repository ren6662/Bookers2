class Book < ApplicationRecord

  has_one_attached :image
  belongs_to :user
  validates :book_name, presence: true
  validates :caption, presence: true

  def get_image
    if image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    else
      'no_image.jpg'
    end
  end

end