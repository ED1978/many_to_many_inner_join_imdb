require_relative('./models/movie.rb')
require_relative('./models/star.rb')
require_relative('./models/Casting.rb')

require('pry-byebug')

Casting.delete_all()
Movie.delete_all()
Star.delete_all()

# Movie
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

pitt = Star.new (
  {
    'first_name' => 'Brad',
    'last_name' => 'Pitt'
  }
)
pitt.save()

robbie = Star.new (
  {
    'first_name' => 'Margot',
    'last_name' => 'Robbie'
  }
)
robbie.save()

pheonix = Star.new (
  {
    'first_name' => 'Joaquin',
    'last_name' => 'Pheonix'
  }
)
pheonix.save()

deniro = Star.new (
  {
    'first_name' => 'Robert',
    'last_name' => 'De Niro'
  }
)
deniro.save()

conroy = Star.new (
  {
    'first_name' => 'Frances',
    'last_name' => 'Conroy'
  }
)
conroy.save()

found_star = Star.find(conroy.id)

deniro.first_name = 'Bobby'
deniro.update()

# deniro.delete()

stars = Star.all()

# Casting
dicaprio_hollywood_casting = Casting.new (
  {
    'movie_id' => hollywood.id,
    'star_id' => dicaprio.id,
    'fee' => 15000000
  }
)
dicaprio_hollywood_casting.save()

pitt_hollywood_casting = Casting.new (
  {
    'movie_id' => hollywood.id,
    'star_id' => pitt.id,
    'fee' => 10000000
  }
)
pitt_hollywood_casting.save()

robbie_hollywood_casting = Casting.new (
  {
    'movie_id' => hollywood.id,
    'star_id' => robbie.id,
    'fee' => 7000000
  }
)
robbie_hollywood_casting.save()

pheonix_joker_casting = Casting.new (
  {
    'movie_id' => joker.id,
    'star_id' => pheonix.id,
    'fee' => 11000000
  }
)
pheonix_joker_casting.save()

deniro_joker_casting = Casting.new (
  {
    'movie_id' => joker.id,
    'star_id' => deniro.id,
    'fee' => 9000000
  }
)
deniro_joker_casting.save()

conroy_joker_casting = Casting.new (
  {
    'movie_id' => joker.id,
    'star_id' => conroy.id,
    'fee' => 6000000
  }
)
conroy_joker_casting.save()

binding.pry
nil
