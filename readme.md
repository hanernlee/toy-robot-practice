##The Toy Robot Simulator

### About

The application is a simulation of a toy robot moving on a square tabletop of dimension 5 x 5 units with no other obstructions on the table surface.

## Installation
Please note that you must have Ruby installed to run this app. Clone or Download this repository and `$ cd` into the directory and then run the below command in terminal.
```
$ bundle install
```

## Usage
To start the app make sure you are in the directory of the folder and in your terminal run the below command.
```
$ ruby bin/main.rb
```
Begin with the respective commands. To exit the app hit `q` and press `ENTER`
## Testing
RSpec is implemented for testing code quality. To run tests, run the below command.
```
$ rspec
```
## Design & Scaleability

### Two Robots

- The current app is designed in such a way where two Robots can be placed on the same ```Table``` at the same time. By separating the ```Commander```, ```Robot``` and ```Table``` Classes there is less dependency between them allowing for this feature. This is possible by initialising a second ```Commander``` and ```Robot``` in the ```Simulator```.

### Dynamic Table

- The ```Table``` where the ```Robot``` moves on is designed dynamically where if no dimensions were specified, it will take on the default size of 5 x 5 units. By initialising a ```Table``` with different dimensions in the Simulator and Constraint Class (eg.```Table.new(8,9)```), the ```Robot``` will still move within that ```Table``` obeying the same commands and constraints.

### Compass / Directions

- Initially there was a massive ```if```/```else``` statement for the ```RotateCommand```. However, as these were cardinal directions, the code was refactorized to implement modular arithmetic:

1. Get the **index** of current direction based on the ```COMPASS``` array.
2. ```+``` or ```-``` the **index** in Step 1, depending on ```RIGHT``` or ```LEFT``` commands respectively.
3. Modulo the new **index** by 4  to obtain the remainder which will provide the new direction based on the ```COMPASS``` array.

```
COMPASS = ["NORTH","EAST","SOUTH","WEST"]
def rotate_left
  @robot.current_position.direction = COMPASS[(COMPASS.index(@robot.current_position.direction) - 1) % 4]
end

def rotate_right
  @robot.current_position.direction = COMPASS[(COMPASS.index(@robot.current_position.direction) + 1) % 4]
end
```

## Thought Process

It was during a Rails Camp when I decided to attempt the Toy-Robot coding challenge. I had no idea how or where to even begin but started off with one giant Class which I didn't know back then, was really really bad practice.

A Senior Ruby Developer was kind enough to guide me in the right direction and taught me the design principle for separation of concerns. The idea was to break features into distinct Classes so that each Class can address a separate concern, encouraging scalable and maintainable code.

For someone new to programming, it was the most valuable concept I learnt. This concept not only made my code much cleaner and readable but it was also much easier to test the code using RSpec.

## Specification

### Description
- The application is a simulation of a toy robot moving on a square tabletop, of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be prevented from falling to destruction. Any movement
that would result in the robot falling from the table must be prevented, however further valid movement commands must still
be allowed.

*Create an application that can read in commands of the following form*
`PLACE X,Y,F`
`MOVE`
`LEFT`
`RIGHT`
`REPORT`

- `PLACE` will put the toy robot on the table in position `X,Y` and facing `NORTH`, `SOUTH`, `EAST` or `WEST`.
- The origin (`0,0`) can be considered to be the `SOUTH WEST` most corner.
- The first valid command to the robot is a `PLACE` command, after that, any sequence of commands may be issued, in any order, including another `PLACE` command. The application should discard all commands in the sequence until a valid `PLACE` command has been executed
- `MOVE` will move the toy robot one unit forward in the direction it is currently facing.
- `LEFT` and `RIGHT` will rotate the robot 90 degrees in the specified direction without changing the position of the robot.
- `REPORT` will announce the `X`,`Y` and `F` of the robot. This can be in any form, but standard output is sufficient.

<ul>
<li>A robot that is not on the table can choose to ignore the <code>MOVE</code>, <code>LEFT</code>, <code>RIGHT</code> and <code>REPORT</code> commands.</li>
<li>Input can be from a file, or from standard input, as the developer chooses.</li>
<li>Provide test data to exercise the application.</li>
</ul>

### Constraints
The toy robot must not fall off the table during movement. This also includes the initial placement of the toy robot.
Any move that would cause the robot to fall must be ignored.

Example Input and Output:

a)
`PLACE 0,0,NORTH`
`MOVE`
`REPORT`
Output: `0,1,NORTH`

b)
`PLACE 0,0,NORTH`
`LEFT`
`REPORT`
Output: `0,0,WEST`

c)
`PLACE 1,2,EAST`
`MOVE`
`MOVE`
`LEFT`
`MOVE`
`REPORT`
Output: `3,3,NORTH`
