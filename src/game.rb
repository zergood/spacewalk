class Game < Chingu::Window
  def initialize
    super(width = 960, height = 640, fullscreen = false, update_interval = 16.666666)
    push_game_state(Menu.new())
  end
end