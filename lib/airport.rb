require './lib/plane.rb'

class Airport

attr_reader :capacity, :planes

DEFAULT_CAPACITY = 10

  def initialize
    @planes = []
    @capacity = DEFAULT_CAPACITY
  end

  def release_plane(plane)
    return false if empty? || stormy?
    plane.take_off
    @planes.delete(plane)
  end

  def dock(plane)
    fail "Airport unavailable" if full? || stormy?
    plane.land
    @planes << plane
  end

  def stormy?
    rand(40) == 6 ? "stormy" : "sunny"
  end

  private

  def full?
    @planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @planes.empty?
  end

end
