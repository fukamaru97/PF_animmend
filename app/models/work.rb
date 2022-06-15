class Work < ApplicationRecord
  has_one_attached :image
  has_many :work_tags, dependent: :destroy
  has_many :tags, through: :work_tags
  has_many :post_comments, dependent: :destroy

  validates :name, presence: true
  validates :story, presence: true
  validates :image, presence: true

  def get_image
    if image.attached?
      image
    else
      'no_image.jpeg'
    end
  end

  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.work_tags.delete WorkTag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_work_tag = WorkTag.find_or_create_by(tag_name: new)
      self.work_tags << new_work_tag
    end
  end

end
