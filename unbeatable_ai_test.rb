require "minitest/autorun"
require_relative "unbeatable_ai.rb"

class TestWinOrBlock < Minitest::Test
	def test_O_takes_winning_space_two
		cpu = UnbeatableAI.new("O")
		assert_equal(2, cpu.get_move(["O", "O", " ", " ", " ", " ", "X", " ", "X"]))
	end

	def test_O_takes_winning_space_six
		cpu = UnbeatableAI.new("O")
		assert_equal(6, cpu.get_move(["X", "X", "O", " ", "O", " ", " ", " ", "X"]))
	end

	def test_O_takes_blocking_space_three
		cpu = UnbeatableAI.new("O")
		assert_equal(3, cpu.get_move(["O", " ", " ", " ", "X", "X", " ", " ", "O"]))
	end

	def test_O_takes_blocking_space_zero
		cpu = UnbeatableAI.new("O")
		assert_equal(0, cpu.get_move([" ", "X", "X", " ", "O", " ", " ", "O", " "]))
	end

	def test_O_takes_blocking_space_three
		cpu = UnbeatableAI.new("O")
		assert_equal(5, cpu.get_move(["O", " ", " ", "X", "X", " ", " ", "O", " "]))
	end
end

class TestForFork < Minitest::Test
	def test_O_fork_returns_zero
		cpu = UnbeatableAI.new("O")
		assert_equal(0, cpu.get_move([" ", "O", " ", " ", "O", "X", " ", "X", " "]))
	end

	def test_O_fork_returns_six
		cpu = UnbeatableAI.new("O")
		assert_equal(6, cpu.get_move([" ", "X", " ", " ", "O", "X", " ", "O", " "]))
	end

	def test_O_fork_returns_two
		cpu = UnbeatableAI.new("O")
		assert_equal(2, cpu.get_move(["X", " ", " ", " ", " ", " ", "O", "X", "O"]))
	end
end

class TestBlockOpponentFork < Minitest::Test
	def test_block_opponents_fork_O_returns_1
		cpu = UnbeatableAI.new("O")
		assert_equal(1, cpu.block_opponents_fork(["X", " ", " ", " ", "O", " ", " ", " ", "X"]))
	end
end

class TestCenterMove < Minitest::Test
	def test_O_takes_center_returns_four_example_1
		cpu = UnbeatableAI.new("O")
		assert_equal(4, cpu.check_for_center(["X", " ", " ", " ", " ", " ", " ", " ", " "]))	
	end	

	def test_O_takes_center_returns_four_example_2
		cpu = UnbeatableAI.new("O")
		assert_equal(4, cpu.check_for_center([" ", " ", " ", " ", " ", " ", " ", " ", "X"]))	
	end
end

class TestOpponentCorner < Minitest::Test
	def test_0_opponent_corner_returns_8
		cpu = UnbeatableAI.new("O")
		assert_equal(8, cpu.opponent_corner(["X", " ", " ", " ", " ", " ", " ", " ", " "]))
	end

	def test_2_opponent_corner_returns_6
		cpu = UnbeatableAI.new("O")
		assert_equal(6, cpu.opponent_corner([" ", " ", "X", " ", " ", " ", " ", " ", " "]))
	end

	def test_6_opponent_corner_returns_2
		cpu = UnbeatableAI.new("O")
		assert_equal(2, cpu.opponent_corner([" ", " ", " ", " ", " ", " ", "X", " ", " "]))
	end

	def test_8_opponent_corner_returns_0
		cpu = UnbeatableAI.new("O")
		assert_equal(0, cpu.opponent_corner([" ", " ", " ", " ", " ", " ", " ", " ", "X"]))
	end
end

class TestEmptyCorner < Minitest::Test
	def test_empty_corner_returns_0
		cpu = UnbeatableAI.new("O")
		assert_equal(0, cpu.check_empty_corner([" ", " ", " ", "X", " ", " ", " ", " ", " "]))
	end

	def test_empty_corner_returns_2
		cpu = UnbeatableAI.new("O")
		assert_equal(2, cpu.check_empty_corner(["X", " ", " ", " ", "O", " ", " ", "X", " "]))
	end

	def test_empty_corner_returns_6
		cpu = UnbeatableAI.new("O")
		assert_equal(6, cpu.check_empty_corner(["X", "O", "X", " ", "O", " ", " ", "X", " "]))
	end

	def test_empty_corner_returns_8
		cpu = UnbeatableAI.new("O")
		assert_equal(8, cpu.check_empty_corner(["X", "O", "X", "X", "O", " ", "O", "X", " "]))
	end
end

class TestEmptyEdge < Minitest::Test
	def test_empty_edge_returns_1
		cpu = UnbeatableAI.new("O")
		assert_equal(1, cpu.check_empty_side(["O", " ", " ", " ", "X", " ", " ", " ", "X"]))
	end
end

class TestUnbeatableAI < Minitest::Test
	def test_create_player_returns_players_marker
		cpu = UnbeatableAI.new("O")
		assert_equal("O", cpu.marker)
	end
end







# require "minitest/autorun"
# require_relative "unbeatable_ai.rb"

# class TestUnbeatableAI < Minitest::Test
# 	def test_create_player_returns_players_marker
# 		player = UnbeatableAI.new("X")
# 		assert_equal("X", player.marker)
# 	end

# 	def test_first_available_space_returned_one
#         player = UnbeatableAI.new("X")
#         assert_equal(1, player.get_move(["X", " ", " ", " ", " ", " ", " ", " ", " "]))
# 	end

# 	def test_first_available_space_returned_three
#         player = UnbeatableAI.new("X")
#         assert_equal(3, player.get_move(["X", "O", "X", " ", " ", "O", " ", "X", " "]))
# 	end
# end

# class TestWinOrBlock < Minitest::Test
# 	def test_X_takes_winning_space_two
# 		player = UnbeatableAI.new("X")
# 		assert_equal(2, player.check_for_win(["X", "X", " ", " ", " ", " ", "O", " ", "O"]))
# 	end

# 	def test_O_takes_winning_space_six
# 		player = UnbeatableAI.new("O")
# 		assert_equal(6, player.check_for_win(["X", "X", "O", " ", "O", " ", " ", " ", "X"]))
# 	end

# 	def test_X_takes_blocking_space_three
# 		player = UnbeatableAI.new("X")
# 		assert_equal(3, player.check_for_block(["X", " ", " ", " ", "O", "O", " ", " ", "X"]))
# 	end

# 	def test_X_takes_blocking_space_zero
# 		player = UnbeatableAI.new("X")
# 		assert_equal(0, player.check_for_block([" ", "O", "O", " ", "X", " ", " ", "X", " "]))
# 	end

# 	def test_O_takes_blocking_space_three
# 		player = UnbeatableAI.new("O")
# 		assert_equal(5, player.check_for_block(["X", " ", " ", "O", "O", " ", " ", "X", " "]))
# 	end
# end

# class TestForFork < Minitest::Test
# 	def test_X_fork_returns_zero
# 		player = UnbeatableAI.new("X")
# 		assert_equal(0, player.check_for_fork([" ", "X", " ", " ", "X", "O", " ", "O", " "]))
# 	end

# 	def test_X_fork_returns_six
# 		player = UnbeatableAI.new("X")
# 		assert_equal(6, player.check_for_fork([" ", "O", " ", " ", "X", "O", " ", "X", " "]))
# 	end

# 	def test_X_fork_returns_two
# 		player = UnbeatableAI.new("X")
# 		assert_equal(2, player.check_for_fork(["O", " ", " ", " ", " ", " ", "X", "O", "X"]))
# 	end

# 	def test_O_fork_returns_two
# 		player = UnbeatableAI.new("O")
# 		assert_equal(1, player.check_for_fork(["O", " ", " ", " ", " ", " ", "X", "O", "X"]))
# 	end
# end