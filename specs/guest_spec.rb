require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../guest')

class TestGuest < MiniTest::Test

  def setup
  @guest1 = Guest.new("James")
  @guest2 = Guest.new("Jack")
end

def test_guest_name
  assert_equal("James", @guest1.name)
end

end
