class AddWebsiteToWork < ActiveRecord::Migration[6.1]
  def change
    add_column :works, :website, :text
  end
end
