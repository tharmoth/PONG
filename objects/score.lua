--! file:score.lua
--! builds a seven segment display out of a 60x100 rectangle array
--[[ 
       6 6 6
      1     5
      1     5
      1     5
       7 7 7 
      2     4
      2     4
      2     4
       3 3 3
 ]]--
Score = GameObject:extend()
function Score:new(area, x, y, opts)  
   Score.super.new(self, area, x, y, opts)
   self.scoreCount = opts.scoreCount or 0
   self.scoreTable = {}
   
    --! Sevensegment rectangles
   table.insert(self.scoreTable, Rectangle(self.area, x,    y,    {width = 20, height = 60})) 
   table.insert(self.scoreTable, Rectangle(self.area, x,    y+40, {width = 20, height = 60}))
   table.insert(self.scoreTable, Rectangle(self.area, x,    y+80, {width = 60, height = 20}))
   table.insert(self.scoreTable, Rectangle(self.area, x+40, y+40, {width = 20, height = 60}))
   table.insert(self.scoreTable, Rectangle(self.area, x+40, y,    {width = 20, height = 60}))
   table.insert(self.scoreTable, Rectangle(self.area, x,    y,    {width = 60, height = 20}))
   table.insert(self.scoreTable, Rectangle(self.area, x,    y+40, {width = 60, height = 20}))
   
    --! Sevensegment known outputs
       self.outputTable[1]   = Score:returnSelectValues({         4, 5      }) 
       self.outputTable[2]   = Score:returnSelectValues({   2, 3,    5, 6, 7})
       self.outputTable[3]   = Score:returnSelectValues({      3, 4, 5, 6, 7})
       self.outputTable[4]   = Score:returnSelectValues({1,       4, 5,    7})
       self.outputTable[5]   = Score:returnSelectValues({1,    3, 4,    6, 7})
       self.outputTable[6]   = Score:returnSelectValues({1, 2, 3, 4,    6, 7})
       self.outputTable[7]   = Score:returnSelectValues({         4, 5, 6   })
       self.outputTable[8]   = Score:returnSelectValues({1, 2, 3, 4, 5, 6, 7})
       self.outputTable[9]   = Score:returnSelectValues({1,       4, 5, 6, 7})
       self.outputTable['0'] = Score:returnSelectValues({1, 2, 3, 4, 5, 6   })
       self.outputTable['P'] = Score:returnSelectValues({1, 2,       5, 6, 7})
       self.outputTable['N'] = Score:returnSelectValues({1, 2,    4, 5, 6   })
       self.outputTable['G'] = Score:returnSelectValues({1,    3, 4, 5, 6, 7})

end
function Score:returnSelectValues(values)
   local table
   for i, #values, 1 do
      table[i] = self.scoreTable[values[i]]
    end
   return table
end
function Score:draw()
     drawScore(self.outputTable[self.scoreCount])
end
function drawScore(enteredTable)
     for i,v in ipairs(enteredTable) do
      v:draw()
   end
end
