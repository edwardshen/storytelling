class CreatePhotosStories < ActiveRecord::Migration
  def self.up
    create_table :photos_stories, :id => false do |t|
      t.integer :photo_id
      t.integer :story_id
    end
  end

  def self.down
    drop_table :photos_stories
  end
end
