class Room

  attr_accessor :capacity, :guests, :songs

  def initialize(capacity, guests, songs)
    @capacity = capacity
    @guests = guests
    @songs = songs
  end

def get_guest_list()
  names = @guests.map { |person| person.name }
  return names
end

def get_playlist()
  playlist = @songs.map { |song| song.name }
  return playlist
end

def guest_enter_room(person)
 @guests.push (person)
end

def remove_guests
  @guests.clear
end

# def play_song




end
