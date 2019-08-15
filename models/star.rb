require_relative('../db/sql_runner')

class Star

  attr_accessor :first_name, :last_name
  attr_reader :id

  def initialize( options )
    @first_name = options['first_name']
    @last_name = options['last_name']
    @id = options['id'].to_i if options['id']
  end

  def save()
    sql = "INSERT INTO stars
    (first_name, last_name)
    VALUES
    ($1, $2)
    RETURNING *"
    values = [@first_name, @last_name]
    @id = SqlRunner.run( sql, values )[0]["id"].to_i()
  end

  def self.delete_all()
    sql = "DELETE FROM stars"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM stars WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    star = self.new(result.first)
    return star
  end

  def update
    sql = "UPDATE stars SET first_name = $1, last_name = $2 WHERE id = $3"
    values = [@first_name, @last_name, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM stars WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

end
