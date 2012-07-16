#!/usr/local/bin/ruby
require 'rubygems'
require 'lingua/stemmer'
require 'ruby-debug'

class Textmatch

	#textmatcher takes in 2 strings from some source and compares them, looking for 
	#word matches, right now just 1-to-1 string matches but eventually it will take
	#in to account grammar, it then produces a visual representation of the matches

	def get_text

	end

	def match_text(string_one, string_two)
		array_one = string_one.split(/\s+|\.\s*|,\s+|;\s+|:\s+|\W*\(|\)\W*/)
		array_two = string_two.split(/\s+|\.\s*|,\s+|;\s+|:\s+|\W*\(|\)\W*/)
		match_ary = []
		stemmer = Lingua::Stemmer.new(:language => 'eng')
		#match_ary[0] = [""] + array_two
		array_one.each do |o_w|
			row = []
			o_stem = stemmer.stem(o_w).downcase
			#row << o_w
			array_two.each do |t_w|
				if t_w == o_w
					row << 1
				else
					t_stem = stemmer.stem(t_w).downcase
					if t_stem == o_stem
						row << 2
					else
						row << 0
					end
				end
			end
			match_ary << row
		end
		match_ary
	end

	def make_image
		
	end
end

