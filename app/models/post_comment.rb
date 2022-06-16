class PostComment < ApplicationRecord

  belongs_to :user  # post_comment.userでコメントしたユーザー取得
  belongs_to :work  # post_comment.workでコメントされた作品を取得

  validates :rate, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1},presence: true #5段階評価

end
