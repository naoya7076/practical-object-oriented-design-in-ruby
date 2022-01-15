class Trip
  attr_reader :bicycles, :customers, :vehicle

  def prepare(preparers)
    preparers.each do {|preparer|
      preparer.prepare_trip(self)}
    end
  end
end

class Mechanic
  def prepare_trip(trip)
    trip.bicycles.each {|bicycle|
      prepare_bicycle(bicycle)}
  end

  def prepare_bicycle
    #略
  end
end

class TripCoordinator
  def prepare_trip(trip)
    buy_food(trips.customers)
  end
end

class Driver
  def prepare_trip(trip)
    vehicle = trip.vehicle
    gas_up(vehicle)
    fill_water_tank(vehicle)
  end
end