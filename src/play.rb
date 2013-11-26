class Play < Chingu::GameState
  traits :viewport, :timer

  def initialize
    super
    @bg1 = Color::BLUE
    @bg2 = Color::CYAN
    @player = Player.create(:x => $window.width/2, :y => $window.height - 128)
    every(5000) { @rock = Rock.create(:x => Random.rand($window.width)) }
  end

  def setup
  end

  def draw
    super
    fill_gradient(:from => @bg1, :to => @bg2)
  end

  def update
    super
    Flame.each_collision(@rock) do |flame, rock|
      flame.destroy
      rock.destroy
    end

    Rock.each_collision(@player) do |player, rock|
      player.destroy
      sleep(2)
      push_game_state(Menu.new())
    end
  end
end