require_relative('./models/movie.rb')

require('pry-byebug')

hollywood = Movie.new (
  {
    'title' => 'Once Upon a Time in Hollywood',
    'genre' => 'Nostalgia'
  }
)
hollywood.save()


binding.pry
nil
