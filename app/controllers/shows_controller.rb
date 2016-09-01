class ShowsController < ApplicationController

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
    params.require(:show).permit(:name, :synopsis, :episodes, :score, :aired)
  end
end
