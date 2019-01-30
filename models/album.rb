require('pg')
require_relative('../db/sql_runner.rb')
require_relative('artist.rb')

class Album

  attr_accessor :title, :genre, :artist_id
  attr_reader :id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @artist_id = options['artist_id']
  end

  def fine_artist
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    results = SqlRunner.run(sql, values)
    artist_data = results[0]
    return Artist.new(artist_data)
  end

  # def find_artist
  #   sql = "SELECT * FROM artits WHERE id = $1"
  #   value = [@artist_id]
  #   artist = SqlRunner.run(sql, value)
  #   return artist.map {|each| artist.new(each)}
  # end

  def save
    sql = "INSERT INTO albums(title, genre, artist_id) VALUES($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def Album.list
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    return albums.map {|album| Album.new(album)}
  end

  def update
    sql = "UPDATE albums SET(title, genre, artist_id)= ($1, $2, $3) WHERE id = $4;"
    values = [@title, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end
















end
