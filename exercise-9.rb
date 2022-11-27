class Employee

  def prepare(bike)
    begin
      # `Bike`-specific behavior belongs in the `Bike` object's method. 
      # `Employee` objects aren't responsible for knowing each type of 
      # prepare method, in my opinion. 
      bike.prepare
    rescue
      puts 'Uhh, boss, I dunno how to do that.'
    end
  end

end

# Create abstraction class and define method to be overridden in subclasses 
class Bike
  def prepare
    raise "Must be implemented by subclass"
  end
end

class BmxBike < Bike

  def prepare
    clean
    # other code here... 
  end

  def clean
    puts 'Cleaning...'
  end

end

class RoadBike < Bike

  def prepare
    lubricate_gears
    # other code here... 
  end

  def lubricate_gears
    puts 'Lubricating gears...'
  end

end

class MountainBike < Bike

  def prepare
    adjust_suspension
    # other code here... 
  end

  def adjust_suspension
    puts 'Adjusting suspension...'
  end

end

class Tricycle < Bike

  def prepare 
    adjust_seat
    # other code here... 
  end

  def adjust_seat
    puts 'Adjusting seat...'
  end

end

bikes = [BmxBike.new, RoadBike.new, MountainBike.new, Tricycle.new]

employee = Employee.new

# Each `Employee` only calls `.prepare` 
bikes.each do |bike|
  employee.prepare(bike)
end
