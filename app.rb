require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'morpion/player'
require 'morpion/board_grid'
require 'morpion/board'
require 'morpion/game'


play = Game.new
	  play.play







