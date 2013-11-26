require 'chingu'
require 'hasu'
load 'src/menu.rb'
load 'src/game.rb'
load 'src/player.rb'
load 'src/play.rb'

include Gosu
include Chingu

Game.new.show