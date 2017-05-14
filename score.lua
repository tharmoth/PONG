--! file:score.lua
--! VERY UGLY PLEASE IMPROVE
Score = Object:extend()
function Score:new(x,y)  
   self.scoreCount = 0
   self.x = x
   self.y = y
   self.scoreTable = {}
   table.insert(self.scoreTable, Rectangle(x,y,20,60,0,0)) 
   table.insert(self.scoreTable, Rectangle(x,y+40,20,60,0,0))
   table.insert(self.scoreTable, Rectangle(x,y+80,60,20,0,0))
   table.insert(self.scoreTable, Rectangle(x+40,y+40,20,60,0,0))
   table.insert(self.scoreTable, Rectangle(x+40,y,20,60,0,0))
   table.insert(self.scoreTable, Rectangle(x,y,60,20,0,0))
   table.insert(self.scoreTable, Rectangle(x,y+40,60,20,0,0))
   --! threeTable = {scoreTable[1],scoreTable[2],scoreTable[3],scoreTable[4],scoreTable[5],scoreTable[6],scoreTable[7]}
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
end
function Score:draw()
  if self.scoreCount == 1 then
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
  elseif self.scoreCount == 0 then
   drawScore(self.zeroTable)
  end
end
function drawScore(enteredTable)
     for i,v in ipairs(enteredTable) do
      v:draw()
   end
end