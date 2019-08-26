class Airport
  attr_reader :planes
  attr_reader :weather
  attr_reader :capacity


  def initialize(capacity = 20)
    @planes = []
    @capacity = capacity
    randomize_weather
  end

  def land(plane)
    stormy?
    airport_full?
    plane.land
    @planes << plane
  end

  def takeoff(plane)
    stormy?
    plane_at_airport?(plane)
    plane.takeoff
    @planes.delete(plane)
  end

  private

  def stormy?
    raise "Stormy - no plane movements at airport" if self.weather == "stormy"
  end

  def airport_full?
    raise "Airport full - no landing" if @planes.length >= self.capacity
    # check - why did I need self.weather and could not use @weather??
  end

  def plane_at_airport?(plane)
    raise "Specified plane not at airport" unless self.planes.include?(plane)
    # not well written - is there an exclude method?
  end

  def randomize_weather
    rand(1..20) < 20 ? @weather = "sunny" : @weather = "stormy"
  end

end