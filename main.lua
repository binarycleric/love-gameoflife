require "board"
require "cell"
require "graphics"

local last_age = 0

function love.load()
  love.graphics.setBackgroundColor(25, 25, 25)
  love.window.setMode(800, 650)

  Graphics.cell_size = 25

  Board:init_cells(800/Graphics.cell_size, 650/Graphics.cell_size)

  math.randomseed( os.time() )

  for i=1, 200 do
    local x = math.random(0, 800/Graphics.cell_size)
    local y = math.random(0, 650/Graphics.cell_size) 

    Board:to_life(x, y)
  end
end

function love.update(dt)
  last_age = last_age + dt

  if last_age >= 0.5 then
    Board:evolve()
    last_age = 0
  end
end

function love.draw()
  for k, cell in pairs(Board.cells) do
    if cell.alive then
      Graphics.draw_cell(cell)
    end
  end
end

