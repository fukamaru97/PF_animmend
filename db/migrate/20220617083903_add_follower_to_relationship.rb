class AddFollowerToRelationship < ActiveRecord::Migration[6.1]
  def change
    add_reference :relationships, :follower, null: false, foreign_key: { to_table: :users }
  end
end
