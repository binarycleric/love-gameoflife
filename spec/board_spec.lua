require "board"

describe("Board", function()

  setup(function()
    Board:setup()
  end)

  describe(":alive_at", function()

    it("returns false if cell is dead", function()
      assert.False(Board:alive_at(1,1))
    end)

    it("returns true if cell is alive", function()
      Board:add_cell(1,1)

      assert.True(Board:alive_at(1,1))
    end)
  end)

end)
