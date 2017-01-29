class Card
    # class variables (private)
    attr_accessor :card_value, :suit, :value

    def initialize(card_value, suit)
        self.card_value = card_value
        self.suit = suit
    end

    def value
      value = case self.card_value.to_i
        when 1
          11
        when 2..10
          self.card_value
        when 11..13
          10
        else
          nil
      end
    end

    def display_card_value
      case self.card_value
        when "11"
          "Jack"
        when "12"
          "Queen"
        when "13"
          "King"
        when "1"
          "Ace"
        else
          self.card_value
        end
    end

    def to_s
      "#{display_card_value} of #{self.suit}, value #{value}"
    end
end