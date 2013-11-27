class Rock < Chingu::GameObject
  traits :velocity, :timer, :collision_detection
  trait :bounding_box, :scale => 0.8, :debug => false

  def initialize(options)
    #super(options.merge(:image => Image["media/bouncing-meteor.png"]))
    super(options)
    @animations = {}
    @animations[:default] = Chingu::Animation.new(:file => "asteroid.gif")
    @animations[:explode] = Chingu::Animation.new(:file => "asteroid_explosion_cut.png", :delay => 50)
    @x = options[:x]
    @y = 0
    @velocity_x = 0
    @velocity_y = options[:velocity]
    self.height = 64
    self.width = 64
  end

  def update
    @image = @animations[:default].next
    if @y > $window.height
      self.destroy
    end
  end

  def explode
    Chingu::Particle.create( :x => @x,
                              :y => @y,
                              :animation => @animations[:explode],
                              :fade_rate => -15,
                              :mode => :default )
    self.destroy
  end
end