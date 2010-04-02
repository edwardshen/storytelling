class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.integer :user_id
      t.integer :fb_user_id
      t.integer :fb_pid
      t.integer :fb_aid
      t.string :src_small
      t.string :src_big

      t.timestamps
    end
    
    #if mysql
    execute("alter table photos modify fb_user_id bigint")
    execute("alter table photos modify fb_pid bigint")
    execute("alter table photos modify fb_aid bigint")
  end

  def self.down
    drop_table :photos
  end
end
