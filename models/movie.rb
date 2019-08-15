require_relative('../db/sql_runner')

class Movie

  attr_reader(:id)
  attr_accessor(:title, :genre)

  def initialize( options )
    @title = options['title']
    @genre = options['genre']
    @id = options['id'] if options['id']
  end

  def save
    sql = "INSERT INTO movies
    (title, genre)
    VALUES
    ($1, $2)
    RETURNING id"
    values = [@title, @genre]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i()
  end

  def self.delete_all
    sql = "DELETE FROM movies"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM movies WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    movie = self.new(result.first)
    return movie
  end

  def update
    sql = "UPDATE movies SET title = $1, genre = $2 WHERE id = $3"
    values = [@title, @genre, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM movies WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
