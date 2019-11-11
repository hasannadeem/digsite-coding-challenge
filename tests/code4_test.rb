require "minitest/autorun"
require "../classes/code4.rb"

class TestArray < Minitest::Test
	def setup
		@testVar = Code4.new
		@testVar.driverMethod
	end

	def test_solution
		assert_equal( "123-456-789", @testVar.solution("1ab2345cd -- 67 e f --g --- - 89"))
		assert_equal( "123-456-78-90", @testVar.solution("12-34 56--78 90"))
		assert_equal( "004-448-555-583-61", @testVar.solution("00-44 48 5555 8361"))
		assert_equal( "022-198-53-24", @testVar.solution("0 - 22 1985--324"))
		assert_equal( "*ERROR* not enough digits", @testVar.solution("blah1--"))
		assert_equal( "123-45-67", @testVar.solution("1234567"))
		assert_equal( "123-456-78", @testVar.solution("123bcxcv456wqw78"))
		assert_equal( "123-456-780", @testVar.solution("123bcxcv456wqw78a0"))
		assert_equal( "12-34", @testVar.solution("1234"))
	end

end
  