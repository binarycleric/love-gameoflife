require "src/board"
require "src/cell"
require "src/graphics"

-- http://en.wikipedia.org/wiki/Conway's_Game_of_Life
function love.load()
  love.window.setTitle("Conway's Game of Life")
  love.graphics.setBackgroundColor(25, 25, 25)
  love.window.setMode(800, 650)

  Board:init_cells(800/Graphics.cell_size, 650/Graphics.cell_size)

  math.randomseed(os.time())

  for i=1, math.random(10000, 25000) do
    local x = math.random(0, 800/Graphics.cell_size)
    local y = math.random(0, 650/Graphics.cell_size) 

    Board:to_life(x, y)
  end
end

function love.update(dt)
  Board:update(dt)
end

function love.draw()
  for k, cell in pairs(Board.cells) do
    if cell.alive then
      Graphics.draw_cell(cell)
    end
  end
end

