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
      else
        render :action => "add"
      end
    end
  end

  def edit
  end

  def delete
  end

  def view
    @movements = Movement.find_by_id(params[:id])
  end
end
