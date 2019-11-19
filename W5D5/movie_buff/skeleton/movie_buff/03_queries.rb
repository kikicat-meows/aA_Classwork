def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.

  Movie.select(:id, :title)
       .joins(:actors)
       .where(actors: {name: those_actors})
       .group('movies.id')
       .having('COUNT(*) = ?', those_actors.length)



  # all_movies = Movie.includes(:actors).all
  # movies = []
  # # counter = Hash.new(0)

  # all_movies.each do |movie|
  #   count = 0
  #   those_actors.each do |actor| 
  #     count += 1 if movie.actors.name == actor
  #   end
  #   movies << movie if count == those_actors.length
  # end

  # movies
  # those_actors.each do |actor|
  #  movies.concat(
  #    all_movies.select(:id,:title).where(actors: {name: actor}))
  #   #  Movie.select(:id, :title).joins(:actors).where(actors: {name: actor}))
  # end
  
  # movies.each do |movie|
  #   counter[movie] += 1
  # end

  # counter.select {|k,v| v == those_actors.length}.keys
end

def golden_age
  # Find the decade with the highest average movie score.
  Movie.select("AVG(score), (yr / 10) * 10 AS decade")
       .group("decade")
       .order("AVG(score) DESC")
       .first.decade

       ### manipulating using ruby number syntax, anything in the decade becomes labelled by 1920s, 1930s, etc. 
       ### get avg score of that, then must retrieve again

end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery
  sub = Movie.select(:id).joins(:actors).where(actors: {name: name})

  Actor
       .joins(:movies)
       .where.not(actors: {name: name})
       .where(movies: {id: sub})
       .distinct
       .pluck(:name)


end

def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor.left_outer_joins(:castings)
       .where("castings.movie_id IS NULL")
       .select(:name)
       .count

end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.

end
