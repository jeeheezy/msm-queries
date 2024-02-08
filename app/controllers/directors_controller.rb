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

  def youngest
    director_w_dob = Director.where.not({ :dob => nil })
    ordered_director_w_dob = director_w_dob.order({ :dob => "asc" })
    @youngest = ordered_director_w_dob.last
    render({ :template => "director_templates/youngest" })
  end

  def eldest
    director_w_dob = Director.where.not({ :dob => nil })
    ordered_director_w_dob = director_w_dob.order({ :dob => "asc" })
    @eldest = ordered_director_w_dob.first
    render({ :template => "director_templates/eldest" })
  end
end
