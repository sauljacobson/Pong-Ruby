require 'ruby2d' 

require_relative 'player' 
require_relative 'pong' 

set title: "Ruby Pong"
set diagnostics: true 

player1 = Player.new(0, "left") 
player2 = Player.new(615, "right") 
pong = Pong.new()

player1_score = Text.new(player1.score.to_s, x:270, y: 50)  
player2_score = Text.new(player2.score.to_s, x:350, y: 50)  

score_bar = Rectangle.new(
  x: 304, y: 60,
  height: 3, width: 30,
  color: 'white'
)

paddle_speed = 10

on :key_held do |event|
  if event.key == 'w'
    if player1.at_top?
      player1.paddle.y -= 0
    else
      player1.paddle.y -= paddle_speed
    end
  elsif event.key == 's'
    if player1.at_bottom?
      player1.paddle.y += 0
    else
      player1.paddle.y += paddle_speed
    end
  elsif event.key == 'up'
    if player2.at_top? 
      player2.paddle.y -= 0
    else
      player2.paddle.y -= paddle_speed
    end
  elsif event.key == 'down'
    if player2.at_bottom?
      player2.paddle.y += 0 
    else 
      player2.paddle.y += paddle_speed
    end
  end 
end 

update do
  if player1.hit?(pong)
    pong.speed = 8
  elsif player2.hit?(pong) 
    pong.speed = -8
  elsif pong.left_edge?
    pong.speed = 8
    pong.ball.x = get(:width) / 2
    player2.score += 1
    player2_score.text = (player2.score).to_s
  elsif pong.right_edge? 
    pong.speed = -8
    pong.ball.x = get(:width) / 2 
    player1.score += 1
    player1_score.text = (player1.score).to_s
  end
  pong.ball.x += pong.speed   
end


show
