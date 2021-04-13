class WantsController < ApplicationController
  def index
    @wants = Want.all.order('created_at DESC')
  end

  def new
    @want = Want.new
  end

  def create
    @want = Want.new(want_params)
    if @want.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @want = Want.find(params[:id])
  end

  def edit
    @want = Want.find(params[:id])
  end

  def update
    @want = Want.find(params[:id])
    if @want.update(want_params)
      redirect_to want_path(@want.id)
    else
      render :edit
    end
  end
  
  def destroy
    @want = Want.find(params[:id])
    if @want.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  private
  def want_params
    params.require(:want).permit(:title, :text).merge(user_id: current_user.id)
  end
end
