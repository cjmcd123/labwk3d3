require("pg")
require_relative("../sql_runner")
require_relative("album")

class Artist

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
    values = [@name]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def update()
    sql = "UPDATE artists SET name = $1 WHERE id = $2"
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    return results.map{|order| Album.new(order)}
  end

  def delete()
    results = self.albums()
    for album in results
      album.delete()
    end
    sql = "DELETE FROM artists where id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    artist = result.first
    artist = Artist.new(artist)
    return artist
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    return artists.map{|person| Artist.new(person)}
  end

  def self.delete_all()
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

end
