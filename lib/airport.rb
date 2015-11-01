require_relative 'plane'
require_relative 'weather'

class Airport

attr_reader :capacity, :planes, :weather

DEFAULT_CAPACITY = 10

  def initialize(weather = Weather.new)
    @planes = []
    @capacity = DEFAULT_CAPACITY
    @weather = weather
  end

  def release_plane(plane)
    return false if empty? || weather.stormy?
    plane.take_off
    planes.delete(plane)
  end

  def dock(plane)
    fail "Unavailable because airport is full" if full?
    fail "Unable to land due to stormy weather" if weather.stormy?
    plane.land
    planes << plane
  end

  private

  def full?
    planes.count >= DEFAULT_CAPACITY
  end

  def empty?
    planes.empty?
  end

end
