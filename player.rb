class Player 
  attr_accessor :paddle, :side, :score 
  
  def initialize(x, side) 
    @paddle = Rectangle.new(
      x: x, y: 100,
      height: 100, width: 25, 
      color: 'white' 
    ) 
    @side = side
    @score = 0 
  end 

  def hit?(pong) 
    collide_x?(pong) && within_paddle_height?(pong) 
  end 
  
  def at_top?() 
    @paddle.y == 0
  end 

  def at_bottom?() 
    @paddle.y == 380
  end 

  def collide_x?(pong) 
    if (@side == "left") 
      return pong.ball.x - pong.ball.radius <= paddle.x + paddle.width 
    end
    pong.ball.x + pong.ball.radius >= paddle.x 
  end

  def within_paddle_height?(pong)
    pong.ball.y >= paddle.y && pong.ball.y <= paddle.y + paddle.height 
  end 
  
end
