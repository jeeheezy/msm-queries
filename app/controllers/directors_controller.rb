class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def show
    id = params["id"]
    matching_record = Director.where({ :id => id})
    @director = matching_record[0]
    
    @filmography_records = Movie.where({ :director_id => @director.id })


    render({ :template => "director_templates/details"})
  end
end
