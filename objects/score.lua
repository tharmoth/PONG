--! file:score.lua
--! VERY UGLY PLEASE IMPROVE
--! TODO
Score = GameObject:extend()
function Score:new(area, x, y, opts)  
   Score.super.new(self, area, x, y, opts)
   self.scoreCount = opts.scoreCount or 0
   self.scoreTable = {}
   table.insert(self.scoreTable, Rectangle(self.area,x,y,{width = 20, height = 60})) 
   table.insert(self.scoreTable, Rectangle(self.area,x,y+40,{width = 20, height = 60}))
   table.insert(self.scoreTable, Rectangle(self.area,x,y+80,{width = 60, height = 20}))
   table.insert(self.scoreTable, Rectangle(self.area,x+40,y+40,{width = 20, height = 60}))
   table.insert(self.scoreTable, Rectangle(self.area,x+40,y,{width = 20, height = 60}))
   table.insert(self.scoreTable, Rectangle(self.area,x,y,{width = 60, height = 20}))
   table.insert(self.scoreTable, Rectangle(self.area,x,y+40,{width = 60, height = 20}))
   
   self.oneTable = {self.scoreTable[4],self.scoreTable[5]}
   self.twoTable = {self.scoreTable[2],self.scoreTable[3],self.scoreTable[5],self.scoreTable[6],self.scoreTable[7]}
   self.threeTable = {self.scoreTable[3],self.scoreTable[4],self.scoreTable[5],self.scoreTable[6],self.scoreTable[7]}
   self.fourTable = {self.scoreTable[1],self.scoreTable[4],self.scoreTable[5],self.scoreTable[7]}
   self.fiveTable = {self.scoreTable[1],self.scoreTable[3],self.scoreTable[4],self.scoreTable[6],self.scoreTable[7]}
   self.sixTable = {self.scoreTable[1],self.scoreTable[2],self.scoreTable[3],self.scoreTable[4],self.scoreTable[6],self.scoreTable[7]}
   self.sevenTable = {self.scoreTable[4],self.scoreTable[5],self.scoreTable[6]}
   self.eightTable = self.scoreTable
   self.nineTable = {self.scoreTable[1],self.scoreTable[4],self.scoreTable[5],self.scoreTable[6],self.scoreTable[7]}
   self.zeroTable = {self.scoreTable[1],self.scoreTable[2],self.scoreTable[3],self.scoreTable[4],self.scoreTable[5],self.scoreTable[6]}
   self.pTable = {self.scoreTable[1],self.scoreTable[2],self.scoreTable[5],self.scoreTable[6],self.scoreTable[7]}
   self.nTable = {self.scoreTable[1],self.scoreTable[2],self.scoreTable[4],self.scoreTable[5],self.scoreTable[6]}
   self.gTable = {self.scoreTable[1],self.scoreTable[3],self.scoreTable[4],self.scoreTable[5],self.scoreTable[6],self.scoreTable[7]}

end
function Score:draw()
  if self.scoreCount == 0 then
   drawScore(self.zeroTable)
  elseif self.scoreCount == 1 then
   drawScore(self.oneTable)
  elseif self.scoreCount == 2 then
   drawScore(self.twoTable)
  elseif self.scoreCount == 3 then
   drawScore(self.threeTable)
  elseif self.scoreCount == 4 then
   drawScore(self.fourTable)
  elseif self.scoreCount == 5 then
   drawScore(self.fiveTable)
  elseif self.scoreCount == 6 then
   drawScore(self.sixTable)
  elseif self.scoreCount == 7 then
   drawScore(self.sevenTable)
  elseif self.scoreCount == 8 then
   drawScore(self.eightTable)
  elseif self.scoreCount == 9 then
   drawScore(self.nineTable)
  elseif self.scoreCount == "P" then
   drawScore(self.pTable)
  elseif self.scoreCount == "N" then
   drawScore(self.nTable)
  elseif self.scoreCount == "G" then
   drawScore(self.gTable)
  elseif self.scoreCount == 10 then
    local PlayerIndex = self.area:getIndex('player1Score')
    self.area.game_objects[PlayerIndex].scoreCount = 0
    PlayerIndex = self.area:getIndex('player2Score')
    self.area.game_objects[PlayerIndex].scoreCount = 0
  end
end
function drawScore(enteredTable)
     for i,v in ipairs(enteredTable) do
      v:draw()
   end
end