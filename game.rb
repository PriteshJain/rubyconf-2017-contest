####################################################################
#  BlackJack game implementation.  alpha version 1, 12/09/2012     #
#  by Catharina Torok                                              #
#  Two players, Player and Dealer.                                 #
#  Player gets to hit or stay. Dealer only gets dealt two cards.   #
#  After all, this is MY code, and I want BlackJack                #
#    to be in favour of the Player.                                #
####################################################################

require_relative 'lib/card'
require_relative 'lib/player'
require_relative 'lib/rules'
require_relative 'lib/current_deck'


# Testing the code
current_deck = CurrentDeck.new(4);
current_deck.shuffle!
puts "A new deck has been shuffled and there are #{current_deck.remaining} cards"

player = Player.new("Player", current_deck)
player.distribute_cards
puts current_deck.remaining

dealer = Player.new("Dealer", current_deck)
dealer.distribute_cards

puts current_deck.remaining
puts "Player's hand:"
puts player.to_s
puts "Dealer's 1 card:"
puts dealer.show_first_card

rule = Rules.new(player, dealer)
puts rule.more_moves_allowed
if !rule.more_moves_allowed
  rule.calculate
else
  until !rule.more_moves_allowed
    puts "Do you want to hit(h) or stay(s)?"
    action = $stdin.gets.chomp
    if action == "h"
      puts "You chose to hit, here's your new hand"
      player.hit
      puts player.to_s
    elsif action == "s"
      puts "You chose to stay, here's your final hand"
      puts player.to_s
      break
    else
      puts "Not valid, input try again!"
    end
  end

  puts "Dealer's hand:"
  puts dealer.to_s
  puts rule.calculate
end