class Room

  attr_accessor :capacity, :guests, :songs, :price

  def initialize(capacity, guests, songs, price)
    @capacity = capacity
    @guests = guests
    @songs = songs
    @price = price

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

# def select_song(choice)
#   song_choice = @songs.find { |song| song.name == choice}
#   return "Now playing #{song_choice}"
# end

def full_capacity(capacity)
  if @guests.length < capacity
    return "Sorry we're at capacity"
  else
    return "Enjoy!"
  end
end

def check_customers_wallets
  money = @guests.map { |person| person.wallet }
  return money
end

def allow_or_deny_entry
  for guest in @guests
  if guest.wallet > @price
    guest.wallet -= @price
    return "Have fun!"
  else
    return "You don't have enough"
  end
end
end

def ask_guests_for_favourite__song
  favourites = @guests.map { |person| person.fav_song }
  return favourites
end

def guest_gets_fav_song(choice)
  for guest in @guests
    if guest.fav_song == choice
      return "I love this one!"
    end
  end
end




end





# def check_if_guest_can__enter(wallet)
