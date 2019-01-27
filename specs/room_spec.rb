require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../room')
require_relative( '../songs')
require_relative( '../guest')

class TestRoom < MiniTest::Test

  def setup
    @guest1 = Guest.new "Billy Bob"
    @guest2 = Guest.new "Rob"
    @guest3 = Guest.new "Bob"
    @song1 = Song.new "Bat out of hell"
    @song2 = Song.new "Pour some sugar on me"
    @song3 = Song.new "Smells like teen spirit"
    @room1 = Room.new(8, [@guest1, @guest2, @guest3], [@song1, @song2, @song3])
    @guest4 = Guest.new "James"
    @room2 = Room.new(3, [@guest1, @guest2, @guest3], [@song1, @song2, @song3])
  end

  def test_room_capacity()
    assert_equal(8, @room1.capacity)
  end

  def test_guests_in_room()
    assert_equal(["Billy Bob", "Rob", "Bob"], @room1.get_guest_list)
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
    assert_equal("Sorry we're at capacity", @room2.full_capacity )
end 



end
