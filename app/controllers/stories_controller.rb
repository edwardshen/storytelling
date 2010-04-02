class StoriesController < ApplicationController
  before_filter :login_required
  
  def index
    @stories = Story.all
  end
  
  def new
    @story = Story.new(:creator_id => current_user.id)
  end
  
  def show
    @story = Story.find(params[:id])
  end
  
  def edit
    @story = Story.find(params[:id])
  end
  
  def create
    @story = Story.new(params[:story])
    
    respond_to do |wants|
      if @story.save
        flash[:notice] = 'Story was successfully created.'
        wants.html { redirect_to(@story) }
        wants.xml { render :xml => @story, :status => :created, :location => @story }
      else
        wants.html { render :action => "new" }
        wants.xml { render :xml => @story.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(params[:story])
      flash[:notice] = "Successfully updated story."
      redirect_to @story
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @story = Story.find(params[:id])
    begin
      if @story.destroy
        flash[:notice] = "Story deleted."
      else
        flash[:notice] = "Not able to delete the story."
      end
    rescue
      flash[:notice] = "Not able to delete the story."
    end
    redirect_to stories_url
  end
  
end
