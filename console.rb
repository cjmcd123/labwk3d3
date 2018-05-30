require("pry")
require_relative("models/album")
require_relative("models/artist")



artist1 = Artist.new({'name' => 'Jimi Hendrix'})
artist1.save()
artist2 = Artist.new({'name' => 'Nina Simone'})
artist2.save()
artist3 = Artist.new({'name' => 'elvis presley'})
artist3.save()



binding.pry
nil
