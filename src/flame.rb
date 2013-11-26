class Flame < Chingu::GameObject
  traits :velocity, :timer, :collision_detection, :effect
  trait :bounding_box, :scale => 0.8, :debug => false

  def initialize(options)
    @x = options[:x]
    @y = options[:y]
    super(options.merge(:image => Image["media/fire.png"]))
    self.height = 32
    self.width = 32
  end

  def update
      if @y > 0
        @y -= 30
      else
        self.destroy
      end
    end
  end
