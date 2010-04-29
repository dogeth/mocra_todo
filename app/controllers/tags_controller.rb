class TagsController < ApplicationController
  def index
    @tags = Tag.all
    
    respond_to do |wants|
      wants.html { render :action => 'index' }
      wants.js { render :json => @tags }
    end
  end
  
  def list
  end

end
