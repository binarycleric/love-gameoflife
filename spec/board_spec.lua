require "src/board"
require "src/cell"
require "src/graphics"

describe("Board", function()

  before_each(function()
    Board.cells = {}
  end)

  describe(":init_cells", function()

    it("contains array of dead cells", function()
      Board:init_cells(10, 10)

      assert.are.same(10 * 10, #Board.cells)
    end)

  end)

  describe(":cell_at", function()

    it("returns cell object at location", function()
      assert.False(Board:cell_at(1, 1).alive)
    end)

  end)

  describe(":to_life", function()

    before_each(function()
      Board:init_cells(1, 1)
    end)

    it("brings cell to life at x, y coordinate", function()
      Board:to_life(1, 1)

      assert.True(Board:cell_at(1, 1).alive)
    end)

  end)

  describe(":evolve", function()

    before_each(function()
      Board:init_cells(5, 5)
    end)

    context("cell evolution logic", function()

      it("kills cell with 1 neighbor", function()
        Board:to_life(1, 1)
        Board:to_life(1, 2)

        Board:evolve()

        assert.False(Board:cell_at(1, 1).alive)
        assert.False(Board:cell_at(1, 2).alive)
      end)

      it("keeps cell alive with 2 neighbors", function()
        Board:to_life(1, 1)
        Board:to_life(1, 2)
        Board:to_life(1, 3)

        Board:evolve()

        assert.False(Board:cell_at(1, 1).alive)
        assert.True(Board:cell_at(1, 2).alive)
        assert.False(Board:cell_at(1, 3).alive)
      end)
 
      it("keeps cell alive with 3 neighbors", function()
        Board:to_life(1, 1)
        Board:to_life(1, 2)
        Board:to_life(1, 3)
        Board:to_life(1, 4)

        Board:evolve()

        assert.False(Board:cell_at(1, 1).alive)
        assert.True(Board:cell_at(1, 2).alive)
        assert.True(Board:cell_at(1, 3).alive)
        assert.False(Board:cell_at(1, 4).alive)
      end)

    end)

  end)

end)
