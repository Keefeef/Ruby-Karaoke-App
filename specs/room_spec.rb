require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../room')
require_relative( '../songs')
require_relative( '../guest')

class TestRoom < MiniTest::Test

  def setup
    @guest1 = Guest.new("Billy Bob", 10, "Bat out of hell")
    @guest2 = Guest.new("Rob", 15, "Pour some sugar on me")
    @guest3 = Guest.new("Bob", 12, "Smells like teen spirit")
    @song1 = Song.new "Bat out of hell"
    @song2 = Song.new "Pour some sugar on me"
    @song3 = Song.new "Smells like teen spirit"
    @room1 = Room.new(8, [@guest1, @guest2, @guest3], [@song1, @song2, @song3], 5)
    @guest4 = Guest.new("James", 2, "Baby")
    @room2 = Room.new(3, [@guest4], [@song1, @song2, @song3], 7)
  end

  def test_room_capacity()
    assert_equal(8, @room1.capacity)
  end

  def test_guests_in_room()
    assert_equal([ "Billy Bob", "Rob", "Bob"], @room1.get_guest_list)
  end

  def test_get_playlist()
    p @room1
    assert_equal(["Bat out of hell", "Pour some sugar on me", "Smells like teen spirit"], @room1.get_playlist)
  end

  def test_room_has_guests
    assert_equal(3, @room1.guests().length())
  end

  def test_guest_enter_room
    @room1.guest_enter_room(@guest4)
    assert_equal(["Billy Bob", "Rob", "Bob", "James"], @room1.get_guest_list)
  end

  def test_guests_removed
    @room1.remove_guests
    assert_equal(0, @room1.guests.length)
  end

  # def test_select_song
  #   assert_equal("Now playing Smells like teen spirit", @room1.select_song("Smells like teen spirit"))
  # end

  def test_full_capacity
    assert_equal("Sorry we're at capacity", @room2.full_capacity(4))
end

def test_customer_wallets
  assert_equal([10, 15, 12], @room1.check_customers_wallets)
end

def test_allow_entry
  assert_equal("Have fun!", @room1.allow_or_deny_entry)
end

def test_deny_entry
  assert_equal("You don't have enough", @room2.allow_or_deny_entry )
end

def test_money_is_taken
  @room1.allow_or_deny_entry
  assert_equal(5, @guest1.wallet)
end

def test_fav_songs
  assert_equal(["Bat out of hell", "Pour some sugar on me", "Smells like teen spirit"],
  @room1.ask_guests_for_favourite__song)
end

def test_guest_gets_fav_song
  assert_equal("I love this one!", @room1.guest_gets_fav_song("Bat out of hell"))
end 



end
