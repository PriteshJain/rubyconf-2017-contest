require_relative 'deck'
class CurrentDeck
	attr_accessor :cards

	def initialize(no_of_decks)
		self.cards = [];
		no_of_decks.times do
			deck = Deck.new
			self.cards = self.cards + deck.cards
		end
	end
  def shuffle!
    self.cards.shuffle!
  end
  def draw
    self.cards.pop
  end
  def remaining
    self.cards.length
  end

end