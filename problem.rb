
class Plateau 
  LOWER_COORDINATE = {"x" => 0, "y" => 0}
  def initialize
    @upper_coordinate = {"x" => 5, "y" => 5}
  end

end

class MarsRover 
  MOVEMENT = {
    "N" => {"x" => 0, "y"=> 1}, 
    "S" => {"x" => 0, "y" => -1},
    "E" => {"x" => 1, "y" => 0},
    "W" => {"x" => -1, "y" => 0}
  }
  ORIENTATIONS = ["N","E","S","W"]
  def initialize x,y,orientation
    @position = {"x" => x, "y" => y, "orientation" => orientation}
  end
  def rotate_right 
    new_orientation_index = (ORIENTATIONS.find_index(@position["orientation"]) + 1) % ORIENTATIONS.length
    @position["orientation"] = ORIENTATIONS.at(new_orientation_index)
  end
  def rotate_left
    new_orientation_index = (ORIENTATIONS.find_index(@position["orientation"]) + -1) % ORIENTATIONS.length
    @position["orientation"] = ORIENTATIONS.at(new_orientation_index)
  end
  def move
    @position["x"] = @position["x"] + MOVEMENT[@position["orientation"]]["x"]
    @position["y"] = @position["y"] + MOVEMENT[@position["orientation"]]["y"]
  end
  def position
    @position
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
end


