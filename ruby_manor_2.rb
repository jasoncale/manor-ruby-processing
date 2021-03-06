# Ruby Manor 2

class RubyManor2 < Processing::App

  load_library :video
    
  # We need the video classes to be included here.
  include_package "processing.video"
    
  attr_accessor :capture, :sample_rate
  
  def setup
    frame_rate 12
    smooth
    size(800, 600)
    no_stroke
  
    @sample_rate = 10
    
    # You can get a list of cameras
    # by doing Capture.list
    # 
    # 
    # or you can use your default
    # webcam by leaving it out of
    # the parameters ..
    #     
    # camera = "Sony Eye Toy (2)"
    # @capture = Capture.new(self, width, height, camera, 30)

    @capture = Capture.new(self, width, height, 30)
  end

  def draw    
    capture.read if capture.available
    convert_pixels
  end
  
  def clear
    background 255
    no_stroke
    ellipse_mode(CORNER)
  end
  
  def convert_pixels
    clear
    
    (1...height).step(sample_rate) do |y|
      (1...width).step(sample_rate) do |x|
        
        pixel = y * capture.width + x
        
        r = red(capture.pixels[pixel])
        g = green(capture.pixels[pixel])
        b = blue(capture.pixels[pixel])

        fill(r, g, b, 255)

        ellipse(x, y, sample_rate, sample_rate)
      end
    end
    
    capture.update_pixels
  end
  
end

RubyManor2.new :title => "Ruby Manor 2"