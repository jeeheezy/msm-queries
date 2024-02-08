class ActorsController < ApplicationController
  def index
    render({ :template => "actor_templates/list"})
  end

  def show
    id = params["id"]
    matching_record = Actor.where({ :id => id})
    @actor = matching_record[0]
    
    render({ :template => "actor_templates/details"})
  end
end
