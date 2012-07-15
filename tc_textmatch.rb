# tc_textmatch.rb

require "textmatch"
require "test/unit"

class TestTextmatch < Test::Unit::TestCase
	
	def test_match_simple #direct match
		expected = [[1,0,0],
								[0,1,0],
								[0,0,1]]
		tmatch = Textmatch.new
		actual = tmatch.match_text("This should match", "This should match")
		assert_equal(expected, actual)
	end

	def test_match_print #more complex, not exact match
		tmatch = Textmatch.new
		result = tmatch.match_text("I like to swim, she said", "to swim is what I like")
		result.each {|row| puts "#{row.join(" ")}"}
		expected = [[0,0,0,0,1,0],
								[0,0,0,0,0,1],
								[1,0,0,0,0,0],
								[0,1,0,0,0,0],
								[0,0,0,0,0,0],
								[0,0,0,0,0,0]]
		assert_equal(expected, result)
	end

	def test_visualize

	end
end