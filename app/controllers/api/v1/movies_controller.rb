class Api::V1::MoviesController < Api::V1::BaseApiController
  before_action :get_movie, except: [:new, :create, :index]
  def index
    render json: Movie.all
  end

  def new

  end

  def show

  end

  def create
    @movie =Movie.new(movie_params)
    if @movie.save
      status = true
    else
      status = false
    end
    render json: {status: status}
  end

  def edit
    render json: @movie
  end

  def update
    if @movie.update_attributes(movie_params)
      status = true
    else
      status = false
    end
    render json: {status: status}
  end

  def destroy
    if @movie.destroy
      status = true
    else
      status = false
    end
    render json: {status: status}
  end

  def get_movie
    @movie = Movie.find params[:id]
  end  

  private
    def movie_params
      params.permit(:name, :email, :contact)
    end
end