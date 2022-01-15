class Customer
  attr_reader :on_date, :of_difficulty, :need_bike
  def initialize(on_date, of_difficulty, need_bike)
    @on_date = on_date
    @of_difficulty = of_difficulty
    @need_bike = need_bike
  end
end

class Trip
  def suitable_trips(on_date, of_difficulty)
    # 略
  end
end

class Bicycle
  def suitable_bicycle(trip_date, route_type)
    # 略
  end
end

class TripFinder
  def suitable_trips(customer)
    trips = Trip.suitable_trips(customer.on_date, customer.of_difficulty)
    if customer.need_bike
      trips.select do |trip|
        bicycles = Bicycle.suitable_bicycle(customer.on_date, trip.route_type)
      end
    end
  end
end

trip_finder = TripFinder.new
moe = Customer.new(trip_date: Date.today, skill_level: 'M', need_bike: true)
trip_finder.suitable_trips(moe)