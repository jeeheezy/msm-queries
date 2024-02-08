class MoviesController < ApplicationController
  def index
    render({ :template => "movies_templates/list"})
  end

  def show
    id = params["id"]
    matching_record = Movie.where({ :id => id})
    @movie = matching_record[0]

    render({ :template => "movies_templates/details"})
  end
end
