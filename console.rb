require("pry")
require_relative("models/album")
require_relative("models/artist")

Album.delete_all
Artist.delete_all

artist1 = Artist.new({'name' => 'Jimi Hendrix'})
artist1.save()
artist2 = Artist.new({'name' => 'Nina Simone'})
artist2.save()
artist3 = Artist.new({'name' => 'elvis presley'})
artist3.save()

album1 = Album.new({
  'title' => 'Electric Ladyland',
  'genre' => 'Psychedelic rock',
  'artist_id' => artist1.id
})
album2 = Album.new({
  'title' => 'Bold as Love',
  'genre' => 'Psychedelic rock',
  'artist_id' => artist1.id
})
album3 = Album.new({
  'title' => 'I Put a Spell on You',
  'genre' => 'Vocal Jazz',
  'artist_id' => artist2.id
})
album4 = Album.new({
  'title' => 'Let It All Out',
  'genre' => 'Jazz',
  'artist_id' => artist2.id
})
album5 = Album.new({
  'title' => 'Moody Blue',
  'genre' => 'Soft rock',
  'artist_id' => artist3.id
})
album6 = Album.new({
  'title' => 'From Elvis in Memphis',
  'genre' => 'Rock',
  'artist_id' => artist3.id
})
album1.save()
album2.save()
album3.save()
album4.save()
album5.save()
album6.save()

binding.pry
nil
