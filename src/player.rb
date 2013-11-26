class Player < Chingu::GameObject
  traits :velocity, :timer, :collision_detection, :effect

  attr_accessor :score

  def initialize(options)
    @score = 0
    @speed = 4
    @x = options[:x]
    @y = options[:y]
    super(options.merge(:image => Image["media/space.png"]))
    self.input = { :holding_left => :left, :holding_right => :right, :space => :fire}
    @flames = []
  end

  def left
    @x += -20
  end

  def right
    @x += 20
  end

  def fire
    flame = Chingu::Particle.create(:x => @x,
                                      :y => @y,
                                      :image => Gosu::Image.load_tiles($window, "media/fireball.png", 32, 32, true)[0]
    )
    flame.scale(2)
    @flames << flame
  end

  def update
    super
    @flames.map do |flame|
      if flame.y > 0
        flame.y -= 30
      else
        flame.destroy
      end
    end
  end
end