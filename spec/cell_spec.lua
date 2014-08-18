require "src/board"
require "src/cell"
require "src/graphics"

describe("Cell", function()

  it("creates cell at x, y coords", function()
    local cell = Cell.create({x=1, y=1})

    assert.are.same(1, cell.x)
    assert.are.same(1, cell.y)
  end)

end)
