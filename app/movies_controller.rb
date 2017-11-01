# Replace the '__' in the below methods to to make the specs pass!
# Each '__' corresponds to a single line of code you will need to write.
# See the example below on the left and how it should look on the right.
# def make_a_new_movie_instance    # def make_a_new_movie_instance
#   movie = __                     #   movie = Movie.new
# end                              # end

def can_be_instantiated_and_then_saved
  movie = Movie.new
  movie.title = "This is a title."
  movie.save
end

def can_be_created_with_a_hash_of_attributes
  attributes = {
      title: "The Sting",
      release_date: 1973,
      director: "George Roy Hill",
      lead: "Paul Newman",
      in_theaters: false
  }
  movie = Movie.create(attributes)
end

def can_be_created_in_a_block
  Movie.create do |m|
    m.title = "Home Alone"
    m.release_date=1990
  end
end

def can_get_the_first_item_in_the_database
  Movie.all.first.title
end

def can_get_the_last_item_in_the_database

  Movie.all.last.title
end

def can_get_size_of_the_database
  Movie.all.length
end

def can_find_the_first_item_from_the_database_using_id
  Movie.find_by(id: 1).title
end

def can_find_by_multiple_attributes
  Movie.find_by(title: "Title", release_date: 2000, director: "Me")
  # title == "Title"
  # release_date == 2000
  # director == "Me"

end

def can_find_using_where_clause_and_be_sorted
  new_array=Movie.all.select {|movie| movie.release_date > 2002}
  new_array.sort {|a,b| b.release_date<=>a.release_date}
  #ActiveRecord::Base.connection.execute("SELECT * FROM movies WHERE release_date > 2002 ORDER BY release_date DESC;")
  #binding.pry
end

def can_be_found_updated_and_saved
  # Updtate the title "Awesome Flick" to "Even Awesomer Flick"
  Movie.create(title: "Awesome Flick")
  movie = Movie.find_by(title: "Awesome Flick")
  movie.title = "Even Awesomer Flick"
  movie.save

end

def can_update_using_update_method
  # Update movie title to "Wat, huh?"
  Movie.create(title: "Wat?")
  Movie.find_by(title: "Wat?").id
  Movie.update(Movie.find_by(title: "Wat?").id, :title =>  "Wat, huh?")

end

def can_update_multiple_items_at_once
  # Change title of all movies to "A Movie"
  5.times do |i|
    Movie.create(title: "Movie_#{i}", release_date: 2000+i)
  end
  movies = {1 => {:title=>"A Movie"}, 2 => {:title=>"A Movie"}, 3 => {:title=>"A Movie"}, 4 => {:title=>"A Movie"}, 5 => {:title=>"A Movie"}}
  Movie.update(movies.keys, movies.values)
end

def can_destroy_a_single_item
  Movie.create(title: "That One Where the Guy Kicks Another Guy Once")
  Movie.destroy(Movie.find_by(title: "That One Where the Guy Kicks Another Guy Once").id)
  Movie.all
end

def can_destroy_all_items_at_once
  10.times do |i|
    Movie.create(title: "Movie_#{i}")
  end
  Movie.destroy_all()
end
