require('pry')
require_relative('../models/album.rb')
require_relative('../models/artist.rb')

artist_1 = Artist.new({'name' => "Kira"})
artist_2 = Artist.new({'name' => "Paul"})

artist_1.save()
artist_2.save()

album_1 = Album.new({
  'title' => 'sing',
  'genre' => 'pop',
  'artist_id' => artist_1.id
  })

  album_2 = Album.new({
    'title' => 'ring',
    'genre' => 'classic',
    'artist_id' => artist_2.id
    })



    album_1.save()
    album_2.save()

     Album.list()
     Artist.list()

     artist_2.name = 'jojo'
     artist_2.update()






binding.pry
nil
