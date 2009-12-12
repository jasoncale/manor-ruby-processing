# Ruby Manor 1

class RubyManor1 < Processing::App

  load_library :video
    
  # We need the video classes to be included here.
  include_package "processing.video"
    
  attr_accessor :capture
  
  def setup    
    frame_rate 30
    smooth
    size(800, 600)
    
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
    image capture, 0, 0
  end
  
end

RubyManor1.new :title => "Ruby Manor 1"