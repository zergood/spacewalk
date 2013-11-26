require 'chingu'
require 'hasu'
load 'src/menu.rb'
load 'src/game.rb'
load 'src/player.rb'
load 'src/play.rb'
load 'src/rock.rb'
load 'src/flame.rb'

include Gosu
include Chingu

Game.new.show