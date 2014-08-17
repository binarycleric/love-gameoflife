Board = {
  cells = {},
  lookup_table = {},
  last_evolve = 0
}

function Board:init_cells(width, height)
  for x=0, width do
    for y=0, height do
      local cell = Cell.create({x=x, y=y})
      cell.alive = false

      table.insert(self.cells, cell)
      Board:add_cell_to_lookup_table(cell)
    end
  end
end

function Board:add_cell(x, y)
  local cell = Cell.create({x=x, y=y})

  table.insert(self.cells, cell) 
end

function Board:to_life(x, y)
  self:cell_at(x, y).alive = true
end

function Board:add_cell_to_lookup_table(cell)
  self.lookup_table[cell.x] = self.lookup_table[cell.x] or {}
  self.lookup_table[cell.x][cell.y] = cell 
end

function Board:from_lookup_table(x, y)
  if self.lookup_table[x] then
    if self.lookup_table[x][y] then
      return self.lookup_table[x][y]
    end
  end
end

function Board:cell_at(x, y)
  return self:from_lookup_table(x, y)
end

function Board:update(dt)
  self.last_evolve = self.last_evolve + dt
  if self.last_evolve >= 0.15 then
    Board:evolve()
    self.last_evolve = 0
  end
end

function Board:evolve()
  local cell_life_map = {}

  for k, cell in pairs(self.cells) do
    local count = 0

    for x=-1, 1 do
      for y=-1, 1 do

        if not(x == 0 and y == 0) then
          local cell = self:cell_at(cell.x + x, cell.y + y)
          if cell and cell.alive then
            count = count + 1
          end
        end
      end
    end

    if cell.alive then
      if count == 2 or count == 3 then
        cell_life_map[k] = true
      else
        cell_life_map[k] = false
      end
    else
      if count == 3 then
        cell_life_map[k] = true
      end
    end
  end

  for k, cell in pairs(self.cells) do
    cell.alive = cell_life_map[k]
  end
end
