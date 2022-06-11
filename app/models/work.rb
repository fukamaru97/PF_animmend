class Work < ApplicationRecord
  has_one_attached :image
  has_many :genres, dependent: :destroy

  validates :name, presence: true
  validates :story, presence: true
  validates :image, presence: true

  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end

end
