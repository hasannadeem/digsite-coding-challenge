require "minitest/autorun"
require "../classes/code1.rb"

class TestArray < Minitest::Test
  def setup
    @testVar = Code1.new
    @testVar.driverMethod  
  end

  def test_arrays
    assert_equal( 4, @testVar.smallest_absent_int([1,2,3]))
    assert_equal( 4, @testVar.smallest_absent_int([3,2,1]))
    assert_equal( 2, @testVar.smallest_absent_int([1,3,4]))
    assert_equal( 2, @testVar.smallest_absent_int([4,1,3]))
    assert_equal( 1, @testVar.smallest_absent_int([-1,-5]))
    assert_equal( 1, @testVar.smallest_absent_int([3,4,4,6,3]))
    assert_equal( 2, @testVar.smallest_absent_int([-1,0,-1,0,1,0]))
    assert_equal(1001, @testVar.smallest_absent_int((-1000..1000).to_a))
    assert_equal( 101, @testVar.smallest_absent_int((-10..100).to_a + (102..150).to_a))
  end

end
