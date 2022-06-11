class CreateWorkGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :work_genres do |t|

      t.timestamps
    end
  end
end
