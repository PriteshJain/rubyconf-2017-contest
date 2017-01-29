class Deck
  attr_accessor :cards

  Suits = ["C","H","S","D"]
  Ranks = ["1","2","3","4","5","6","7","8","9","10","11","12","13"]

  def initialize
    self.cards = []
    Suits.each do |suit|
      Ranks.each do |rank|
        self.cards << Card.new(rank, suit)
      end
    end
  end
end