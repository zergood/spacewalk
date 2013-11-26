class Highscore < Chingu::GameState
  def initialize()
    super
    Chingu::HighScoreList.load('highscore.yml')
  end
end