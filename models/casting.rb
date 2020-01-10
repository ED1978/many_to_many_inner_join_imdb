require_relative('../db/sql_runner.rb')

class Casting

  attr_accessor :movie_id, :star_id, :fee
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i if options['movie_id']
    @star_id = options['star_id'].to_i if options['star_id']
    @fee = options['fee']
  end

  # CREATE
  def save()
    sql = "INSERT INTO castings
    (
      movie_id,
      star_id,
      fee
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@movie_id, @star_id, @fee]
    casting = SqlRunner.run(sql, values).first
    @id = casting['id'].to_i
  end

  # READ
  def self.all()
    sql = "SELECT * FROM castings"
    castings = SqlRunner.run(sql)
    return castings.map { |casting| Casting.new(casting) }
  end

  def self.find(id)
    sql = "SELECT * FROM castings WHERE id = $1"
    values = [id]
    casting_hash = SqlRunner.run(sql, values).first
    casting = Casting.new(casting_hash)
  end

  # UPDATE
  def update()
    sql = "UPDATE castings SET
    (
      movie_id,
      star_id,
      fee
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@movie_id, @star_id, @fee, @id]
    SqlRunner.run(sql, values)
  end

  # DELETE
  def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end

end
