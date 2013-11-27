class Player < Chingu::GameObject
  traits :velocity, :timer, :collision_detection
  trait :bounding_box, :scale => 0.8, :debug => false

  attr_accessor :score

  def initialize(options)
    super(options.merge(:image => Image["media/space.png"]))
    @score = 0
    @animations = {}
    @animations[:explode] = Chingu::Animation.new(:file => "space_explosion.png")
    self.rotation_center = :bottom_center
    @x = options[:x]
    @y = options[:y]
    self.input = { :holding_left => :left, :holding_right => :right, :holding_up => :up, :holding_down => :down, :space => :fire}
    self.height = 64
    self.width = 64
    @flames = []
  end

  def left
    @x += -10
  end

  def right
    @x += 10
  end

  def up
    @y -= 10
  end

  def down
    @y += 10
  end

  def fire
    @flame = Flame.create(:x => @x, :y => @y)
  end

  def update
    super
  end

  def die
    Chingu::Particle.create(:x => @x,
                             :y => @y,
                             :animation => @animations[:explode],
                             :fade_rate => -5,
                             :mode => :default )
    self.destroy
  end
end