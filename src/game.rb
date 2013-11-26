class Game < Chingu::Window
  def initialize
    super
    push_game_state(Menu.new())
  end
end