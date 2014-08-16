Board = {cells = {}}

function Board:draw(cell_size)
  for x, ys in pairs(self.cells) do
    for y, alive in pairs(ys) do
      if alive then
        Board.drawCell(x, y, cell_size)
      end
    end
  end
end

function Board:add(x, y)
  self.cells[x] = self.cells[x] or {}
  self.cells[x][y] = true
end

function Board:kill(x, y)
  if self.cells[x][y] then
    table.remove(self.cells[x], y)
  end
end

function Board:age()
  for x=1, #self.cells do
    if self.cells[x] then
      for y=1, #self.cells[x] do
      
      end
    end
  end
end




function Board.drawCell(x, y, cell_size)
  love.graphics.setColor(0, 250, 0)
  love.graphics.rectangle("fill", 
                          x * cell_size, 
                          y * cell_size, 
                          cell_size, 
                          cell_size)

  love.graphics.setColor(250, 250, 250)
  love.graphics.rectangle("line", 
                          x * cell_size, 
                          y * cell_size, 
                          cell_size, 
                          cell_size)
end

function Board.is_alive(num_neighbors)
  if num_neighbors < 2 then
    return false 
  end

  if num_neighbors == 2 or num_neighbors == 3 then
    return true 
  end

  if num_neighbors > 4 then
    return false 
  end
end
