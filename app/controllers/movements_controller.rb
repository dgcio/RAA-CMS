class MovementsController < ApplicationController
  def index
    @movements = Movement.all :limit => 15
  end

  def add
    @movements = Movement.new
  end

  def create
    @movements = Movement.new(params[:movement])

    if request.post?
      @movements.user_id = session[:user][:id]
      if @movements.save 
        redirect_to movements_view_path(@movements.id)
        flash[:notice] = "Succesfully created Movement"
      else
        render :action => "add"
      end
    end
  end

  def edit
    @movements = Movement.find_by_id(params[:id])
  end

  def update
    @movements = Movement.find_by_id(params[:id])

    if request.post?
      if @movements.update_attributes(params[:movements])
        redirect_to movements_view_path(params[:id])
        flash[:notice] = "Movement succesfully updated."
      else
        render :action => :edit
      end
    end
  end

  def delete
    @movements = Movement.find_by_id(params[:id]).destroy
    if @movements
      redirect_to movements_path
      flash[:notice] = "Movement #{params[:id]} succesfully deleted."
    end
  end

  def view
    @movements = Movement.find_by_id(params[:id])
    @users = User.joins(:movements).where(:id => @movements.user_id).limit 1
    @show_comments = Comment.find_all_by_movement_id(params[:id])    
  end
end
