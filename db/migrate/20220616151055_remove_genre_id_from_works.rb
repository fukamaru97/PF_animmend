class RemoveGenreIdFromWorks < ActiveRecord::Migration[6.1]
  def change
    remove_column :works, :genre_id, :integer
  end
end
