class BloggersController < ApplicationController
  before_action :set_blogger, only: [:show]
  
  def new
    @blogger = Blogger.new
  end

  def create
    new_blogger = Blogger.create(blogger_params(:name, :bio, :age))

      if new_blogger.valid?
        redirect_to blogger_path(new_blogger)
      else 
        redirect_to new_blogger_path 
      end 
  end 

  def show

  end


  private

  def set_blogger
    @blogger = Blogger.find(params[:id])
  end 

  def blogger_params(*args)
    params.require(:blogger).permit(*args)
  end 

end
