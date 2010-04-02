class PhotosController < ApplicationController
  before_filter :login_required
  before_filter :load_story
  
  def index
    @photos = @story.photos
  end
  
  
  def import_photos_page
    unless params[:aid].blank?
      @album_photos = Photo.get_fb_album_photos(facebook_session, params[:aid])
    end
  end
  
  def import_photos
    unless params[:photo_ids].blank?
      params[:photo_ids].each do |key, value|
        srcs = value[:src].split(',')
        begin
          if photo = Photo.create(:user_id => current_user.id, 
                       :fb_user_id => facebook_session.user.uid,
                       :fb_pid => key.to_i,
                       :fb_aid => params[:aid].to_i,
                       :src_small => srcs[0],
                       :src_big => srcs[1])
            @story.photos << photo 
          end
        rescue
          puts 'Error occurs at creating the photo'
        end
      end
    end
    redirect_to :action => 'import_photos_page'
  end
  
  private
    
    def load_story
      @story = Story.find(params[:story_id])
    end
end
