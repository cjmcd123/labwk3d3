require("pg")
require_relative("../sql_runner")
require_relative("artist")

class Album

  attr_reader :title, :genre, :artist_id
  attr_accessor :id

  def initialize(options)
    @id = options["id"].to_i
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i
  end

  def save()
    sql = "INSERT INTO albums (
    title,
    genre,
    artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    album = SqlRunner.run(sql)
    return album.map{|group| Album.new(group)}
  end

  def self.delete_all()
  sql = "DELETE FROM albums"
  SqlRunner.run(sql)
  end

end
