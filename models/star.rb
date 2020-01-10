require_relative('../db/sql_runner.rb')

class Star

  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  # CREATE
  def save()
    sql = "INSERT INTO stars
    (
      first_name,
      last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@first_name, @last_name]
    star = SqlRunner.run(sql, values).first
    @id = star['id'].to_i
  end

  # READ
  def self.find(id)
    sql = "SELECT * FROM stars WHERE id = $1"
    values = [id]
    star_hash = SqlRunner.run(sql, values).first
    star = Star.new(star_hash)
  end

  # UPDATE


  # DELETE
  def self.delete_all()
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end

end
