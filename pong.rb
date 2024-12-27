require 'ruby2d' 

class Pong
    attr_accessor :ball, :x_speed, :y_speed 

    def initialize()
      @ball = Circle.new(
        x: 320, y: 240,
        radius: 9, color: 'white'       
      )
      @x_speed = 8 
      @y_speed = 8 
    end

    def left_edge?()  
      @ball.x < -30
    end

    def right_edge?()
      @ball.x > 670 
    end

    def at_top?()
      @ball.y + @ball.radius  <= 0
    end

    def at_bottom?() 
      @ball.y + @ball.radius >= 480 
    end

    def reset?() 
     @ball.x == 320 
    end 
end
