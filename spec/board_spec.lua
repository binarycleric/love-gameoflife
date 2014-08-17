require "board"

describe("Board", function()

  describe(".is_alive", function()

    it("dies when has < 2 neighbors", function()
      assert.False(Board.is_alive(0))
      assert.False(Board.is_alive(1))
    end)

    it("lives with 2 or 3 neighbors", function()
      assert.True(Board.is_alive(2))
      assert.True(Board.is_alive(3))
    end)

    it("dies with 4 neighbors", function()
      assert.False(Board.is_alive(4))
      assert.False(Board.is_alive(5))
    end)

  end)

end)
