require "board"
local last_age = 0

function love.load()
  love.graphics.setBackgroundColor(25, 25, 25)
  love.window.setMode(800, 650)

  -- build init cells
  Board:add(1, 1)
  Board:add(1, 2)
  Board:add(1, 3)

  Board:add(2, 1)
  Board:add(2, 2)

  Board:add(3, 2)
end

function love.update(dt)
  last_age = last_age + dt

  if last_age >= 1 then
    Board:age()
    last_age = 0
  end
end

function love.draw()
  Board:draw(25)
end

