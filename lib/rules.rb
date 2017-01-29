class Rules
	attr_accessor :player1 , :player2
	def initialize(player1, player2)
		self.player1 = player1
		self.player2 = player2
	end

	def more_moves_allowed
		player1.hand_value < 21
	end

	def calculate
		return 'This game is a tie' if is_tie
		return "#{player1.title} wins by bust \n#{player1.title} => #{player1.hand_value}\n#{player2.title} => #{player2.hand_value}" if is_over_21(player1)
		return "#{player2.title} wins by bust \n#{player2.title} => #{player2.hand_value}\n#{player1.title} => #{player1.hand_value}" if is_over_21(player2)
		return "#{player1.title} wins by blackjack \n#{player1.title} => #{player1.hand_value}\n#{player2.title} => #{player2.hand_value}" if is_blackjack(player1)
		return "#{player2.title} wins by blackjack \n#{player2.title} => #{player2.hand_value}\n#{player1.title} => #{player1.hand_value}" if is_blackjack(player2)
		return "#{player2.title} wins by blackjack \n#{player2.title} => #{player2.hand_value}\n#{player1.title} => #{player1.hand_value}" if is_blackjack(player2)

		closer =  closer_to_bj;
		return "#{closer[0].title} wins as its closer to blackjack \n#{closer[0].title} => #{closer[0].hand_value}\n#{closer[1].title} => #{closer[1].hand_value}"
		return
	end

	def is_blackjack(player1)
		player1.hand_value == 21
	end

	def is_over_21(player1)
		player1.hand_value > 21
	end

	def is_tie
		self.player1.hand_value == self.player2.hand_value
	end

	def closer_to_bj
		self.player1.hand_value > self.player2.hand_value ? [self.player1, self.player2] : [self.player2, self.player1]
	end

end