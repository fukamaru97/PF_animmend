class WorkGenre < ApplicationRecord
  belongs_to :work
  belongs_to :genre

  validates :work_id, presence: true
  validates :genre_id, presence: true
end
