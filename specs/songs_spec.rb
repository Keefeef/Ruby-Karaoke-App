require( 'minitest/autorun' )
require( 'minitest/rg' )
require_relative( '../songs')

class TestSong < MiniTest::Test

  def setup
    @song1 = Song.new ("One")
  end

  def test_return_name
    assert_equal("One", @song1.name)
  end

end
