require_relative('./models/movie.rb')

require('pry-byebug')

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

binding.pry
nil
