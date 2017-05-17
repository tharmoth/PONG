Ball = Rectangle:extend()
function Ball:new(area, x, y, opts)
    Ball.super.new(self, area, x, y, opts)
    self:reset()
end
function Ball:update(dt)
    --! Get where we want to move
    --! Perform collision check
    self:stopCollision("topBoarder",bottomBounceBall)
    self:stopCollision("bottomBoarder",topBounceBall)
    self:stopCollision("player1",rightBounce)
    self:stopCollision("player2",leftBounce)
    self:stopCollision("leftBoarder",rightBound)
    self:stopCollision("rightBoarder",leftBound)
    --! Deal with collision
    --! Update location
    Ball.super.update(self, dt)
end
--! Checks if ball intersects passed object if so does passed function
function Ball:stopCollision(object,funct)
    local collisionObject = self.area:getIndex(object)
    if checkCollision(self.area.game_objects[collisionObject],self) then
      funct(self,collisionObject)
    end
end
--! Following bounce functions are passed to detectCollision to perfrom effects on the ball when it bounces
function topBounceBall(self,collisionObject)
  self.y = self.area.game_objects[collisionObject].y-self.height
  self.speedy = self.speedy * -1
  topHit:play()
end
function bottomBounceBall(self,collisionObject)
  self.y = self.area.game_objects[collisionObject].y + self.area.game_objects[collisionObject].height
  self.speedy = self.speedy * -1
  topHit:play()
end
function rightBounce(self,collisionObject)
  self.x = self.area.game_objects[collisionObject].x+self.area.game_objects[collisionObject].width
  self.speedx = self.speedx * -1.1
  self.speedy = self.area.game_objects[collisionObject].speedy*.25
  paddleHit:play()
end
function leftBounce(self,collisionObject)
  self.x = self.area.game_objects[collisionObject].x-self.width
  self.speedx = self.speedx * -1.1
  self.speedy = self.area.game_objects[collisionObject].speedy*.25
  paddleHit:play()
end
--! Deletes the ball and spawns another and incremets the scoring players score
--! I should probably just reset the ball but i wanted to test out the dead state.
function rightBound(self,collisionObject)
  wallHit:play()
  local winningPlayer = self.area:getIndex('player1Score')
     if self.area.game_objects[winningPlayer].scoreCount != 9 then        
        self.area.game_objects[winningPlayer].scoreCount = self.area.game_objects[winningPlayer].scoreCount + 1   
    else       
        self.area.game_objects[winningPlayer].scoreCount = 0 
    end  
  self.area:addGameObject('Ball',390,300,{width = 20, height = 20, name = 'ball'})
  self.dead = true
end
function leftBound(self,collisionObject)
  wallHit:play()
  local winningPlayer = self.area:getIndex('player2Score')
    if self.area.game_objects[winningPlayer].scoreCount != 9 then
        self.area.game_objects[winningPlayer].scoreCount = self.area.game_objects[winningPlayer].scoreCount + 1
    else
       self.area.game_objects[winningPlayer].scoreCount = 0 
    end    
  self.area:addGameObject('Ball',390,300,{width = 20, height = 20, name = 'ball'})
  self.dead = true
end
function Ball:draw()
    Ball.super.draw(self)
end
--! Sends the ball in a random direction at a random angle
function Ball:reset()
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
