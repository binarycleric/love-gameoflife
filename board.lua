Board = {}

function Board:setup()
  self.cells = {}
end

function Board:add_cell(x, y)
  self.cells[x] = self.cells[x] or {}
  self.cells[x][y] = true
end

function Board:alive_at(x, y)
  if self.cells[x] then
    if self.cells[x][y] then
      return true
    end
  end
  return false
end

function Board:draw(cell_size)
  for x, ys in pairs(self.cells) do
    for y, alive in pairs(ys) do
      if alive then
        Board.drawCell(x, y, cell_size)
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


