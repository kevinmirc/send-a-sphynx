class CreatePhotoFetchers < ActiveRecord::Migration
  def change
    create_table :photo_fetchers do |t|

      t.timestamps null: false
    end
  end
end
