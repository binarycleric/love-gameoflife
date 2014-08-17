Graphics = {
  cell_size = 5
}

function Graphics.draw_cell(cell)
  local cell_size = Graphics.cell_size 

  love.graphics.setColor(0, 250, 0)
  love.graphics.rectangle("fill", 
                          cell.x * cell_size, 
                          cell.y * cell_size, 
                          cell_size, 
                          cell_size)

  love.graphics.setColor(250, 250, 250)
  love.graphics.rectangle("line", 
                          cell.x * cell_size, 
                          cell.y * cell_size, 
                          cell_size, 
                          cell_size)

end
