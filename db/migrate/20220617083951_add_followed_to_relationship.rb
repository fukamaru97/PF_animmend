class AddFollowedToRelationship < ActiveRecord::Migration[6.1]
  def change
    add_reference :relationships, :followed, null: false, foreign_key: { to_table: :users }
  end
end
