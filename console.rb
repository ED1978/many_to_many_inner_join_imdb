require_relative('./models/movie.rb')
require_relative('./models/star.rb')

require('pry-byebug')

# Movie
Movie.delete_all()

hollywood = Movie.new (
  {
    'title' => 'Once Upon a Time in Hollywood',
    'genre' => 'Nostalgia'
  }
)
hollywood.save()

joker = Movie.new (
  {
    'title' => 'Joker',
    'genre' => 'Comic Book'
  }
)
joker.save()

hollywood.genre = 'True Crime'
hollywood.update()

found_movie = Movie.find(hollywood.id)

# hollywood.delete()

movies = Movie.all()

# Star
dicaprio = Star.new (
  {
    'first_name' => 'Leonardo',
    'last_name' => 'DiCaprio'
  }
)
dicaprio.save()

# Casting


binding.pry
nil
