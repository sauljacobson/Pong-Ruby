require 'ruby2d' 

class Pong
    attr_accessor :ball, :speed 

    def initialize()
      @ball = Circle.new(
        x: 320, y: 240,
        radius: 9, color: 'white'       
      )
      @speed = 8 
    end

    def left_edge?()  
      @ball.x < -30
    end

    def right_edge?()
      @ball.x > 670 
    end
end
