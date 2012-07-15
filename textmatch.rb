#!/usr/local/bin/ruby
require 'rubygems'
require 'ruby-debug'

class Textmatch

	#textmatcher takes in 2 strings from some source and compares them, looking for 
	#word matches, right now just 1-to-1 string matches but eventually it will take
	#in to account grammar, it then produces a visual representation of the matches

	def get_text

	end

	def match_text(string_one, string_two)
		array_one = string_one.split(/\s|\.\s|,\s|;\s/)
		array_two = string_two.split(/\s|\.\s|,\s|;\s/)
		match_ary = []
		#match_ary[0] = [""] + array_two
		array_one.each do |o_w|
			row = []
			#row << o_w
			array_two.each do |t_w|
				if t_w == o_w
					row << 1
				else
					row << 0
				end
			end
			match_ary << row
		end
		match_ary
	end

	def make_image
		
	end
end

