# matchvisualize.rb

require 'rubygems'
require 'RMagick'
require 'textmatch'
include Magick

class Visualize

	def make_image_of(path1, path2, save_path)
		string1 = File.open(path1).read
		string2 = File.open(path2).read
		text = Textmatch.new
		array = text.match_text(string1, string2) #string1 is y-axis, string2 x-axis
		x_size = array[0].length #so array.length = y-axis and array[0].length = x-axis
		y_size = array.length
		vis = Magick::ImageList.new
		vis.new_image(x_size, y_size) {self.background_color = "grey"}
		y_count = 0
		array.each do |y_ax|
			x_count = 0
			y_ax.each do |x_ax|
				if x_ax != 0
					box = Magick::Draw.new
					x1 = x_count #pixel location
					y1 = y_count
					if x_ax == 2
						box.fill('red')
					end
					box.point(x1,y1)
					box.draw(vis)
				else
				end

				x_count += 1
			end
			y_count += 1
		end
		if x_size < 500
			vis = vis.scale(10.0)
		end 
		vis.display
		if save_path
			vis.write(save_path)
		end
		exit	
	end
end

