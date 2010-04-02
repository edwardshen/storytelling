class Story < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :photos
  
  before_destroy :remove_related_items
  
  #validates_uniqueness_of :title, :on => :create, :message => "must be unique"
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  
  private
  
    def remove_related_items
      users.clear
      photos.clear
    end
end
