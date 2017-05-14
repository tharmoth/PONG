function love.load()
   Object = require "classic"
   require "shape"
   require "rectangle"
   require "board"
   require "player"
   require "ball"
   require "score"
   
   topHit = love.audio.newSource("topHit.wav", "static")
   paddleHit = love.audio.newSource("paddleHit.wav", "static")
   wallHit = love.audio.newSource("wallHit.wav", "static")
   math.randomseed( os.time() )
   love.window.setMode( 800, 600)
   player1 = Player(10,0,20,90,"w","s")
   player2 = Player(770,0,20,90,"up","down")
   ball = Ball()
   Board = Board()
   Score1 = Score(400-80,40)
   Score2 = Score(400+40,40)
end
function love.keypressed(key)
  if key == "escape" then
    love.event.quit()
  end
    player1:keyPressed(key)
    player2:keyPressed(key)
end
function love.keyreleased(key)
    player1:keyReleased(key)
    player2:keyReleased(key)
end
function love.update(dt)
   player1:update(dt)
   player2:update(dt)
   ball:update(dt)
end
function love.draw()
   Score1:draw()
   Score2:draw()
   Board:draw()
   player1:draw()
   player2:draw()
   ball:draw()
end