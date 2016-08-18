##The Toy Robot Simulator

### About

The application is a simulation of a toy robot moving on a square tabletop of dimension 5 x 5 units with no other obstructions on the table surface.

## Installation
Please note that you must have at least Ruby version 2.3.0 to run this app. Clone or Download this repository and `$ cd` into the directory and then run the below command in terminal.
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

*In Progress*

## Thought Process

*In Progress*

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
