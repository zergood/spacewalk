class Play < Chingu::GameState
  traits :viewport, :timer

  def initialize
    super
    @player = Player.create(:x => $window.width/2, :y => $window.height - 128)
    every(2000) { @rock = Rock.create(:x => Random.rand($window.width), :velocity => Random.rand(1..8)) }
    @parallax = Chingu::Parallax.new(:x => 0, :y => 0, :rotation_center => :top_left)
    @parallax.add_layer Chingu::ParallaxLayer.new(:image => "background.png", :damping => 20, :zorder => 100, :paused => false, :visible => true, :parallax => @parallax, :repeat_y => true)
  end

  def setup

  end

  def draw
    @parallax.draw
    super
  end

  def update
    super
    @parallax.camera_y -= 3
    @parallax.update
    Flame.each_collision(@rock) do |flame, rock|
      flame.destroy
      rock.explode
    end

    Rock.each_collision(@player) do |rock, player|
      player.die
      #push_game_state(Menu.new())
    end
  end
end