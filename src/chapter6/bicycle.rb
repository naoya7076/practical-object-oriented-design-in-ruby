class Bicycle
  attr_reader :size, :chain, :tire_size
  def initialize(chain: default_chain, tire_size: default_tire_size, **args)
    @size = args[:size]
    @chain = chain
    @tire_size = tire_size

    post_initialize(size, chain, tire_size)
  end

  def post_initialize(**args)
    nil
  end

  def spares
    {
      tire_size: tire_size,
      chain: chain
    }
  end

  def default_chain
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def post_initialize(tape_color)
    @tape_color = tape_color
  end

  def default_tire_size
    '23'
  end

  def spares
    super.merge({ tape_color: tape_color })
  end
end

class MountainBike < Bicycle
  attr_reader :front_shock, :rear_shock
  def initialize(size:, front_shock:, rear_shock:)
    @front_shock = front_shock
    @rear_shock = rear_shock
    super(size)
  end

  def default_tire_size
    '2.1'
  end

  def spares
    super.merge({rear_shock: rear_shock})
  end
end

class RecumbentBike < Bicycle
  attr_reader :flag

  def initialize(flag:)
    @flag = flag
  end
  def default_chain
    '9-speed'
  end

  def spares
    super.merge({flag: flag})
  end
end


pp 'Road Bike'
road_bike = RoadBike.new(
  size: 'M',
  tape_color: 'red'
)
pp road_bike.tire_size
pp road_bike.chain
