class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.boolean :get_alerts

      t.timestamps
    end
  end
end
