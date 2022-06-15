class PostComment < ApplicationRecord

  belongs_to :user  # post_comment.userでコメントしたユーザー取得
  belongs_to :work  # post_comment.workでコメントされた作品を取得

end
