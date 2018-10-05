class CreateShortenedUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.string :url
      t.string :token

      t.timestamps
    end
    add_index :shortened_urls, :url, unique: true
    add_index :shortened_urls, :token, unique: true
  end
end
