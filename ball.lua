Ball = Rectangle:extend()
function Ball:new()
   Ball.super.new(self, 0, 0, 20, 20, 0, 0)
   resetBall(self)
end
function Ball:update(dt)
    self.x = self.x + self.speedx * dt
    self.y = self.y + self.speedy * dt
   
   local window_height = love.graphics.getHeight()
   local window_width = love.graphics.getWidth()
   
   if checkCollision(self,player1) then
     self.speedx = -1 * self.speedx
     if math.abs(self.speedx) < 15 * 200 then
       self.speedx = 1.1 * self.speedx
      end
     self.speedy = player1.speedy * .5
     self.x = player1.x+player1.width
     paddleHit:play()
   end
   if checkCollision(self,player2) then
     self.speedx = -1 * self.speedx 
     if math.abs(self.speedx) < 15 * 200 then
       self.speedx = 1.1 * self.speedx
     end
     self.speedy = player2.speedy * .5
     self.x = player2.x-player2.width
     paddleHit:play()
   end
   if checkCollision(self,Board:returnItem(1)) then
     self.speedy = -1 * self.speedy
     self.y=Board:returnItem(1).y+self.width
     topHit:play()
   end
   if checkCollision(self,Board:returnItem(2)) then
     self.speedy = -1 * self.speedy
     self.y=Board:returnItem(2).y-self.width
     topHit:play()
   end

   if self.x < 0 then
     wallHit:play()
     resetBall(self)
     Score2.scoreCount = Score2.scoreCount + 1
     if Score2.scoreCount == 10 then
       Score1.scoreCount = 0 
       Score2.scoreCount = 0 
     end
   elseif self.x + self.width > window_width then
     wallHit:play()
     resetBall(self)
     Score1.scoreCount  = Score1.scoreCount + 1
     if Score1.scoreCount == 10 then
       Score1.scoreCount = 0 
       Score2.scoreCount = 0 
     end
   end
end
function checkCollision(a, b)
    --With locals it's common usage to use underscores instead of camelCasing
    local a_left = a.x
    local a_right = a.x + a.width
    local a_top = a.y
    local a_bottom = a.y + a.height

    local b_left = b.x
    local b_right = b.x + b.width
    local b_top = b.y
    local b_bottom = b.y + b.height

    --If Red's right side is further to the right than Blue's left side.
    if a_right > b_left and
    --and Red's left side is further to the left than Blue's right side.
    a_left < b_right and
    --and Red's bottom side is further to the bottom than Blue's top side.
    a_bottom > b_top and
    --and Red's top side is further to the top than Blue's bottom side then..
    a_top < b_bottom then
        --There is collision!
        return true
    else
        --If one of these statements is false, return false.
        return false
    end
end
function resetBall(self)
   self.x = 400
   self.y = 300
    if math.random() < .5 then
      self.speedx = 200
    else
      self.speedx = -200
    end
    
    if math.random() < .5 then
      self.speedy = 10 * math.random(20) 
    else
      self.speedy = -10 * math.random(20) 
    end
  end