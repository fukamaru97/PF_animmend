class CreateWorks < ActiveRecord::Migration[6.1]
  def change
    create_table :works do |t|

      t.integer :genre_id
      t.string :name
      t.text :story
      t.timestamps
    end
  end
end
