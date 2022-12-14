def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between 3 and 5
  # (inclusive). Show the id, title, year, and score.
  Movie 
      .select(:id, :title,:yr, :score)
      .where("score BETWEEN 3 AND 5 AND yr BETWEEN 1980 AND 1989")
  
  
end

def bad_years
  # List the years in which no movie with a rating above 8 was released.

  Movie
    .group(:yr)
    .having("MAX(score) <= 8")
    .pluck(:yr)


    #max aggregate 
    #group by 
  
end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Actor 
      .select("actors.id, actors.name")
      .joins(:movies)
      .order("castings.ord")
      .where("movies.title IN (?)", title)
end

def vanity_projects
  # List the title of all movies in which the director also appeared as the
  # starring actor. Show the movie id, title, and director's name.

  # Note: Directors appear in the 'actors' table.

  Movie
    .select("movies.id, movies.title, actors.name")
    .joins(:actors)
    .where("castings.ord = 1 AND actors.id = movies.director_id ")
    
    # group by castings.ord having castings.ord = 1?

    #director name = ORD1's name

    #when castings.ord is 1, then actor_id on that row == lead actor
    #when lead actor == director


    # belongs_to :director,
    # class_name: :Actor,
    # foreign_key: :director_id,
    # primary_key: :id

    # has_many :castings,
    # class_name: :Casting,
    # foreign_key: :movie_id,
    # primary_key: :id,
    # dependent: :destroy




  
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name, and number of supporting roles.

  #expected: [{"id"=>16, "name"=>"Gene Hackman", "roles"=>20}, {"id"=>44, "name"=>"Robert Duvall", "roles"=>20}]


  Actor
      .select("actors.id, actors.name, count(*) AS roles")
      .joins(:castings)
      .where("castings.ord != 1")
      .group("actors.id")
      # .having("castings.ord > 1")
      .order("count(*) desc")
      .limit(2)


         #sqlzoo
      
  
  
end