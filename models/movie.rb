require_relative('../db/sql_runner.rb')

class Movie

  attr_accessor :title, :genre
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
  end

  # CREATE
  def save()
    sql = "INSERT INTO movies
    (
      title,
      genre
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@title, @genre]
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
      genre
    ) =
    (
      $1, $2
    )
    WHERE id = $3"
    values = [@title, @genre, @id]
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
    return stars.map { |star| Star.new(star) }
  end

end
