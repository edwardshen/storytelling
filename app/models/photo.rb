class Photo < ActiveRecord::Base
  has_and_belongs_to_many :stories
  
  validates_uniqueness_of :fb_pid, :on => :create, :message => "must be unique"
  
  def self.get_fb_album_photos(facebook_session, album_id)
    facebook_session.get_photos('', '', album_id)
  end
end
