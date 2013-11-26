class Play < Chingu::GameState
  def initialize
    super
    @bg1 = Color::BLUE
    @bg2 = Color::CYAN
    @player = Player.create(:x => $window.width/2, :y => $window.height - 128)
  end

  def setup
  end

  def draw
    super
    fill_gradient(:from => @bg1, :to => @bg2)
  end

  def update
    super
  end
end