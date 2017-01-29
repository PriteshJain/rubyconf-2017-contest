class Player
  attr_accessor :hand, :hand_value, :deck, :title

  def initialize(title, deck)
      self.title = title
      self.deck = deck
      self.hand = []
      self.hand_value = 0
  end

  def show_first_card
    puts self.hand.first.suit + "-" + self.hand.first.card_value
  end

  def distribute_cards
    2.times do
      hit
    end
  end

  def hit
    card = self.deck.draw
    self.hand << card
    self.hand_value += card.value.to_i
  end

  def to_s
    self.hand.each do |card|
      puts "#{card.suit}-#{card.card_value}"
    end
    puts "total value #{self.hand_value}"
  end
end