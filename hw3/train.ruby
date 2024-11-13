require_relative "route"

$TRAIN_TYPES = ["cargo", "passenger"]

class Train
  attr_reader :VALID_TYPES, :number, :type, :cars_num, :speed
  
  def initialize(number, type, cars_num)
    @number = number
    @type = type
    @cars_num = cars_num
    @speed = 0

    @route = nil

  end

  def speed_up(sp = 1)
    @speed += sp
  end

  def stop
    @speed = 0
  end

  def add_car
    @cars_num += 1
  end

  def remove_car
    @cars_num -= 1
  end

  def route=(route)
    raise ArgumentError, "Invalid route" unless route.is_a?(Route)
    @route = route
    @speed = 0
  end

  def number=(number)
    raise ArgumentError, "Invalid number" unless number.is_a?(Integer)
    @number = number
  end

  def type=(type)
    raise ArgumentError, "Invalid type" unless $TRAIN_TYPES.include?(type)
    @type = type
  end

  def cars_num=(cars_num)
    raise Exception, "Can't change cars number when the train is running" if @speed > 0
    raise ArgumentError, "Cars number must be greater than 0" if cars_num <= 0
    @cars_num = cars_num
  end
end
