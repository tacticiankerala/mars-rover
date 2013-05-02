require "./mars_rover"

describe MarsRover do
  before(:each) do
    @position = {:x => 3, :y => 5, :orientation => "W"}
    @mars_rover = MarsRover.new @position
  end
  it "should initialize with position information" do
    @mars_rover.position[:x].should eql @position[:x]
    @mars_rover.position[:orientation].should eql @position[:orientation]
  end
  it "should rotate to the left by changing the orientation" do
    @mars_rover.rotate_left
    @mars_rover.position[:orientation].should eql "S"
  end
  it "should rotate right by changing the orientation" do
    @mars_rover.rotate_right
    @mars_rover.position[:orientation].should eql "N"
  end
  it "should move the rover forward in west direction" do
    @mars_rover.move
    @mars_rover.position[:x].should eql 2
    @mars_rover.position[:y].should eql @position[:y]
  end
  it "should explore the plataeu based on the operation" do
    position = {:x => 3, :y => 3, :orientation => "E"}
    mars_rover = MarsRover.new position
    mars_rover.explore_plateau "MMRMMRMRRM"
    mars_rover.position[:x].should eql 5
    mars_rover.position[:y].should eql 1
    mars_rover.position[:orientation].should eql "E"
  end
end
