class DirectorsController < ApplicationController
  def index
      render({ :template => "director_templates/list"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details"})
  end

  def youngest
   
  latest_dob = Director.maximum(:dob)

  matching_directors = Director.where({ :dob => latest_dob})

  youngest_director = matching_directors.at(0)
  
  director_name = youngest_director.name

  @youngest_name = director_name

  young_birthdate = youngest_director.dob

  @youngest_date = young_birthdate.strftime("%B %d, %Y")


    render({ :template => "director_templates/youngest"})
  end

def eldest
  latest_dob = Director.minimum(:dob)

  old_matching_directors = Director.where({ :dob => latest_dob})

  eldest_director = old_matching_directors.at(0)
  
  eldest_director_name = eldest_director.name

  @eldest_name = eldest_director_name

  old_birthdate = eldest_director.dob

  @eldest_date = old_birthdate.strftime("%B %d, %Y")


    render({ :template => "director_templates/eldest"})
end


end
