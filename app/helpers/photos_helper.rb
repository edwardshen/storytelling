module PhotosHelper
  def get_cover_photo(cover_pid)
    if cover_pid.to_i > 0
      return facebook_session.get_photos(cover_pid, facebook_session.user.uid)[0]
    else
      nil
    end
  end
  
  def get_photos_of_mine
    facebook_session.get_photos('', facebook_session.user.uid)
  end
end
