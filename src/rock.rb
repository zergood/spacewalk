class Rock < Chingu::GameObject
  traits :velocity, :timer, :collision_detection, :effect
  trait :bounding_box, :scale => 0.8, :debug => false

  def initialize(options)
    @score = 0
    @speed = 4
    @x = options[:x]
    @y = 0
    @velocity_y = 2
    super(options.merge(:image => Image["media/rock.png"]))
    self.height = 30
    self.width = 30
  end

  def update
    @y += 1
    if @y > $window.height
      self.destroy
    end
  end
end