require_relative('../db/sql_runner.rb')
require_relative('./Casting.rb')


class Movie

  attr_accessor :title, :genre, :budget
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @budget = options['budget']
  end

  # CREATE
  def save()
    sql = "INSERT INTO movies
    (
      title,
      genre,
      budget
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@title, @genre, @budget]
    movie = SqlRunner.run(sql, values).first
    @id = movie['id'].to_i
  end

  # READ
  def self.all()
    sql = "SELECT * FROM movies"
    movies = SqlRunner.run(sql)
    return movies.map { |movie| Movie.new(movie) }
  end

  def self.find(id)
    sql ="SELECT * FROM movies WHERE id = $1"
    values = [id]
    movie_hash = SqlRunner.run(sql, values).first
    movie = Movie.new(movie_hash)
  end

  # UPDATE
  def update()
    sql = "UPDATE movies SET
    (
      title,
      genre,
      budget
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@title, @genre, @budget, @id]
    SqlRunner.run(sql, values)
  end

  # DELETE
  def delete()
    sql = "DELETE FROM movies WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  # STARS INNER JOIN
  def stars()
    sql = "SELECT stars.*
    FROM stars
    INNER JOIN castings
    ON castings.star_id = stars.id
    WHERE movie_id = $1"
    values = [@id]
    stars = SqlRunner.run(sql, values)
    results =  stars.map { |star| Star.new(star) }
    return results
  end

  # CASTINGS JOIN
  def castings()
    sql = "SELECT * FROM castings WHERE movie_id = $1"
    values = [@id]
    movie_castings = SqlRunner.run(sql, values)
    results =  movie_castings.map { |casting| Casting.new(casting) }
    return results
  end

  def calculate_total_star_fees()
    movie_castings = castings()
    total_fees = 0
    for casting in movie_castings do
      total_fees += casting.fee.to_i
    end
    return total_fees
  end

  def calculate_remaining_budget()
    return @budget - calculate_total_star_fees()
  end

end
