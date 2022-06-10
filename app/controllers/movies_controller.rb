class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin, except: [:show, :index]

  def index
    @movies = Movie.all
  end

  def show
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    # @movie.user = current_user
    if @movie.save
      flash[:notice] = "Movie was created successfully."
      redirect_to @movie
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
        flash[:notice] = "Movie was updated successfully"
        redirect_to @movie
      else
        render 'edit'
      end
  end

  def destroy
    @movie.destroy!
    redirect_to movies_path
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :image)
  end

  def ensure_admin
    unless current_user.admin?
      redirect_to(movies_path, alert: "You can't perfom this action")
    end
  end

end