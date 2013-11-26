class Player < Chingu::GameObject
  traits :velocity, :timer, :collision_detection, :effect
  trait :bounding_box, :scale => 0.8, :debug => false

  attr_accessor :score

  def initialize(options)
    @score = 0
    @speed = 4
    self.rotation_center = :bottom_center
    @x = options[:x]
    @y = options[:y]
    super(options.merge(:image => Image["media/space.png"]))
    self.input = { :holding_left => :left, :holding_right => :right, :space => :fire}
    self.height = 64
    self.width = 64
    @flames = []
  end

  def left
    @x += -20
  end

  def right
    @x += 20
  end

  def fire
    @flame = Flame.create(:x => @x, :y => @y)
  end

  def update
    super
  end
end