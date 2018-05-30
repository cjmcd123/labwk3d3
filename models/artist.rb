require("pg")
require_relative("../db/sql_runner")
require_relative("album")

class Artist

  attr_reader :id, :name

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO artits (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists"
    customers = SqlRunner.run(sql)
    return customers.map{|person| Artist.new(person)}
  end

end
