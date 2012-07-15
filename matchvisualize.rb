# matchvisualize.rb

require 'rubygems'
require 'RMagick'
require 'textmatch'
include Magick

class Visualize

	def make_image_of(string1, string2)
		text = Textmatch.new
		array = text.match_text(string1, string2) #string1 is y-axis, string2 x-axis
		x_size = (array[0].length)*10 #so array.length = y-axis and array[0].length = x-axis
		y_size = (array.length)*10
		vis = Magick::ImageList.new
		vis.new_image(x_size, y_size) {self.background_color = "grey"}
		y_count = 0
		array.each do |y_ax|
			x_count = 0
			y_ax.each do |x_ax|
				if x_ax == 1
					box = Magick::Draw.new
					x1 = x_count*10 #top left corner
					y1 = y_count*10
					x2 = (x_count + 1)*10 #bottom right corner
					y2 = (y_count + 1)*10
					box.rectangle(x1,y1, x2,y2) #doing as rectangle to allow for scaling depending on image size? Not sure if this really makes sense...  should probably change to a point
					box.draw(vis)
				end
				x_count += 1
			end
			y_count += 1
		end 
		vis.display
		exit	
	end
end

