require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../guest')

class TestGuest < MiniTest::Test

  def setup
  @guest1 = Guest.new("James", 20, "thank u next")
  @guest2 = Guest.new("Jack", 6, "blah")
end

def test_guest_name
  assert_equal("James", @guest1.name)
end

def test_wallet
  assert_equal(20, @guest1.wallet)
end

end
