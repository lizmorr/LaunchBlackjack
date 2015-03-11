#!/usr/bin/env ruby

require 'pry'
require_relative 'models/card'
require_relative 'models/deck'
require_relative 'models/hand'

SUITS = ['♠', '♥', '♦', '♣']
FACE_VALUE = ["A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K"]

def show_dealt(player,card)
  "#{player} was dealt #{card.display}"
end

def show_score(player,hand)
  "#{player} score is: #{hand.score}"
end

def player_game(deck)
  player_hand = Hand.deal(deck)
  player_hand.cards_in_hand.each do |card|
    puts show_dealt("Player",card)
  end
  puts show_score("Player",player_hand)
  puts
  while player_hand.score < 21
    print "Hit or stand? (h/s): "
    player_response = gets.chomp
    puts
    if player_response.downcase == "s"
      break
    else
      card = deck.draw!
      player_hand.add(card)
      puts show_dealt("Player",card)
      puts show_score("Player",player_hand)
    end
  end
  if player_hand.score > 21
    puts
    puts "Bust!!! You lose...."
  end
  if player_hand.score == 21
    puts
    puts "21!!! You win!!!"
  end
  player_hand.score
end

def computer_game(deck)
  computer_hand = Hand.deal(deck)
  computer_hand.cards_in_hand.each do |card|
    puts show_dealt("Computer",card)
  end
  puts show_score("Computer",computer_hand)
  puts
  while computer_hand.score < 17
    card = deck.draw!
    computer_hand.add(card)
    puts show_dealt("Computer",card)
    puts show_score("Computer",computer_hand)
    puts
  end
  if computer_hand.score > 21
    puts "Computer bust!"
  end
  computer_hand.score
end

def game(deck)
  player_result = player_game(deck)
  if player_result < 21
    computer_result = computer_game(deck)
    if computer_result > 21 || computer_result < player_result
      puts "You win!"
    else
      puts "Computer wins! =("
    end
  end
end

deck = Deck.new
game(deck)
