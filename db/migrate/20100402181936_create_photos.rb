class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :user_id
      t.string :fb_user_id
      t.string :fb_pid
      t.string :fb_aid
      t.string :src_small
      t.string :src_big

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
