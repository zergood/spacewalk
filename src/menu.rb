class Menu < Chingu::GameState
  def initialize()
    super
    SimpleMenu.create(
        :menu_items => {'Start Game' => :start_game, "Highscores" => :high_scores,  "Quit" => :exit},
        :size => 20,
        :factor => 3,
        :padding => 10
    )
    @song = Song.new($window, 'media/intro.ogg')
    @song.play
  end

  def start_game
    push_game_state(Play.new())
  end

  def options
    push_game_state(Highscore)
  end

  def quit
    $window.close
  end
end