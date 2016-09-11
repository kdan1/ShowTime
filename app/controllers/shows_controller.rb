class ShowsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :authenticate_admin, only: [:new]

  def index
    @shows = Show.all
  end

  def new
    @show = Show.new
  end

  def edit
    @show = Show.find(params[:id])
  end

  def create
    @show = Show.new(show_params)
    if @show.save
      flash[:success] = "A new show has been created!"
      redirect_to @show
    else
      render "new"
    end
  end

  def update
    @show = Show.find(params[:id])
    if @show.update(show_params)
      flash[:success] = "Show has been changed successfully!"
      redirect_to @show
    else
      render "edit"
    end
  end

  def show
    @show = Show.find(params[:id])
  end

  def destroy
    @show = Show.find(params[:id])
    @show.destroy
    redirect_to shows_path
  end

private
  def show_params
    params.require(:show).permit(:name, :synopsis, :episodes, :score, :show_img, :aired)
  end

  def authenticate_admin
    if !current_user.admin
      render "access_denied"
    end
  end

  def signed_in?
    !current_user.nil?
  end
end
