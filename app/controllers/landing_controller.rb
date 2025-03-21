class LandingController < ApplicationController
  def index
  end

  def actors
    @actors = Actor.page(params[:page]).per(30)  # Corrected: Paginate the instances, not the class
  end

  def show_actors
    @actor = Actor.find(params[:id])
    @movies = @actor.movies  # Movies associated with this actor
  end


  def movies
    # Basic Search Filter
    @movies = Movie.all
    
    # Movie name search
    if params[:search].present?
      @movies = @movies.where("title ILIKE ?", "%#{params[:search]}%")
    end

    # Actor filter
    if params[:actor_id].present?
      actor = Actor.find(params[:actor_id])
      @movies = @movies.joins(:movie_actors).where(movie_actors: { actor_id: actor.id })
    end

    # Pagination (30 movies per page)
    @movies = @movies.page(params[:page]).per(30)

    # For the filter dropdown, show only the first 20 actors
    @actors = Actor.limit(20)
  end


  def show_movie
    @movie = Movie.find(params[:id])
    @actors = @movie.actors # Assuming there's a `has_many :actors` association through movie_actors
    @directors = @movie.directors # Assuming there's a `has_many :directors` association
    @reviews = @movie.reviews # Assuming the reviews are stored in the reviews table
  end

  def directors
    @directors = Director.all.page(params[:page]).per(30) 
  end
  
  def show_director
    @director = Director.find(params[:id])
    @movies = @director.movies  # Movies associated with this director
  end




  

end
