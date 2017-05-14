Board = Object:extend()
function Board:new()
   boardTable = {}
   table.insert(boardTable, Rectangle(0,0,800,20,0,0))
   table.insert(boardTable, Rectangle(0,580,800,20,0,0))
   
   for i=10,600,40 do
    table.insert(boardTable, Rectangle(400,i,20,20,0,0))
   end
end
function Board:returnItem(x)
  return boardTable[x]
  end
function Board:draw()
   for i,v in ipairs(boardTable) do
        v:draw()
   end
end