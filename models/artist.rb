require('pg')
require_relative('album.rb')
require_relative('../db/sql_runner.rb')

class Artist
 attr_accessor :name
 attr_reader :id

 def initialize(options)
   @id = options['id'].to_i if options['id']
   @name = options['name']
 end

 def album
   sql = "SELECT * FROM artists WHERE artist_id = $1"
   values [@id]
   albums = SqlRunner.run(sql, values)
   return albums.map {|album| Album.new(album)}
 end


 def save
   sql = "INSERT INTO artists(name) VALUES($1) RETURNING id"
   values = [@name]
   @id = SqlRunner.run(sql, values)[0]['id'].to_i
 end

 def Artist.list
   sql = "SELECT * FROM artists"
   artists = SqlRunner.run(sql)
   return artists.map {|artist| Artist.new(artist)}
 end

 def update
   sql = "UPDATE artists SET(name) = ($1) WHERE id = $2"
   values = [@name, @id]
   SqlRunner.run(sql, values)
 end








end
