class Bicycle
  attr_reader :size, :chain, :tire_size
  def initialize(args={})
    @size = args[:size]
    @chain = args[:chain] || default_chain
    @tire_size = args[:tire_size] || default_tire_size

    post_initialize(args)
  end

  def post_initialize(args)
    nil
  end

  def spares
    {
      tire_size: tire_size,
      chain: chain
    }.merge(local_spares)
  end

  def default_chain
    '10-speed'
  end

  def default_tire_size
    raise NotImplementedError
  end

  def local_spares
    {}
  end
end

class RoadBike < Bicycle
  attr_reader :tape_color

  def post_initialize(args)
    @tape_color = args[:tape_color]
  end

  def default_tire_size
    '23'
  end

  def local_spares
    { tape_color: tape_color }
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
