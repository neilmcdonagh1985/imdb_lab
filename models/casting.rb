require_relative('../db/sql_runner')
require_relative('movie')
require_relative('star')

class Casting

  attr_reader(:id)
  attr_accessor(:movie_id, :star_id, :fee)

  def initialize( options )
    @movie_id = options['movie_id']
    @star_id = options['star_id']
    @fee = options['fee']
    @id = options['id'] if options['id']
  end

  def save
    sql = "INSERT INTO castings
    (movie_id, star_id, fee)
    VALUES
    ($1, $2, $3)
    RETURNING id"
    values = [@movie_id, @star_id, @fee]
    casting = SqlRunner.run(sql, values).first
    @id = casting['id'].to_i
  end










end
