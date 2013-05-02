class MarsRover
  ORIENTATIONS = ["N","E","S","W"]
  DIRECTIONS = {:left => -1, :right => 1}
  MOVEMENT = {
    "N" => {:x => 0, :y => 1}, 
    "S" => {:x => 0, :y => -1},
    "E" => {:x => 1, :y => 0},
    "W" => {:x => -1, :y => 0}
  }
  def initialize position
    @position = position
  end
  def rotate_left
    rotate DIRECTIONS[:left]
  end

  def rotate_right
    rotate DIRECTIONS[:right]
  end
  def move
    @position[:x] = @position[:x] + MOVEMENT[@position[:orientation]][:x]
    @position[:y] = @position[:y] + MOVEMENT[@position[:orientation]][:y]
  end
  def explore_plateau operations
    possible_operations = {
      "L" => "rotate_left",
      "R" => "rotate_right",
      "M" => "move"
    }
    operations.each_char do |operation|
      self.send(possible_operations[operation])
    end
  end
  def position
    @position
  end
  
  private
  def rotate direction
    current_index = ORIENTATIONS.find_index(@position[:orientation])
    @position[:orientation] = ORIENTATIONS[(current_index + direction) % ORIENTATIONS.length]
  end
end
