def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.

  Movie
    .select("movies.title, movies.id")
    .joins(:actors)
    .where("actors.name IN (?)", those_actors) #name = any value in the array
    .group(:id)
    .having('COUNT(actors.id) >= ?', those_actors.length)



    # .select(:title, :id)
    # .joins(:actors)
    # .where(actors: { name: those_actors }) 
    # .group(:id)
    # .having('COUNT(actors.id) >= ?', those_actors.length)



  # Actor 
  # .select("actors.id, actors.name")
  # .joins(:movies)
  # .order("castings.ord")
  # .where("movies.title IN (?)", title)
  
end

def golden_age
  # Find the decade with the highest average movie score.
  # HINT: Use a movie's year to derive its decade. Remember that you can use
  # arithmetic expressions in SELECT clauses.

  # case when 1980 then 80
  # when 1970 then 70

  # year = 1987
  # (year - (year % 10)
  #         -       7      =    80

  # Movie

    # .group("yr")
    # .order("avg(score) desc")
    # .limit(1)
    # .pluck("(yr - (yr % 10)")

    #PG::SyntaxError: ERROR:  syntax error at or near "ORDER"
    #LINE 1: ...ECT "year" FROM "movies" GROUP BY (yr - (yr % 10) ORDER BY 



   #expected #<Integer:3841> => 1920
    #got #<Movie::ActiveRecord_Relation:9420> => #<ActiveRecord::Relation [#<Movie id: nil>]>



  #1987 -> 80's
  #1977 -> 70's
  
end

def costars(name)
  # List the names of the actors that the named actor has ever appeared with.
  # Hint: use a subquery
  
end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie.
  
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`. A name is
  # like whazzername if the actor's name contains all of the letters in
  # whazzername, ignoring case, in order.

  # E.g., "Sylvester Stallone" is like "sylvester" and "lester stone" but not
  # like "stallone sylvester" or "zylvester ztallone".
  
end

def longest_career
  # Find the 3 actors who had the longest careers (i.e., the greatest time
  # between first and last movie). Order by actor names. Show each actor's id,
  # name, and the length of their career.
  
end