class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image_url
      t.text :description
      t.text :technical_info
      t.belongs_to :user

      t.timestamps
    end
  end
end
