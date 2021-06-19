class Admin::GenresController < ApplicationController
  
  def create
    @genre = Genre.new(genre_params)
    @genre = Genre.save
    redirect_to admin_genres
  end
  
  def index
    @genre = Genre.new
    @genre = Genre.all
  end
  
  def edit
    @genre =Genre.find(params[:id])
  end
  
  def update
    @genre =Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to admin_genres
  end
  
  private
  def genre_params
    params.require(:genre).permit(:name)
  end
  
end
