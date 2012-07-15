# create_textmatch_image.rb

require 'matchvisualize'
require 'optparse'

class ArgsParser
	
	def self.parse(args)
		options = {}
		OptionParser.new do |opts|
			opts.banner = "Usage: create_textmatch_image.rb [options], provide paths for text files
			and path for where the output image should be saved, be sure to inlucde the proper file 
			extension, .jpg, .png, etc. If no save path is provided, the image will not save."

			opts.on("-o", "--text_one [path_to_file]", "Input path for first text") do |one|
				options[:text_one] = one if one =~ /\.txt|\.doc/
			end

			opts.on("-t", "--text_two [path_to_file]", "Input path for second text") do |two|
				options[:text_two] = two if two  =~ /\.txt|\.doc/
			end

			opts.on("-s", "--save_to [path_to_save]", "Input the save path") do |save|
				options[:save_path] = save
			end

		end.parse!
		options
	end

end

options = ArgsParser.parse(ARGV)
path_one = options[:text_one]
path_two = options[:text_two]
save_path = options.has_key?(:save_path) ? options[:save_path] : nil
image = Visualize.new
im_result = image.make_image_of(path_one, path_two, save_path)