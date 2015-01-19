FINAL PROJECT FOR APCS
====
By Peter Strbik and Brandon Lin

Our project is *VirtCube*, a virtual Rubik's Cube simulator.

Features:
- Controls allow you to maneuver the cube's 6 faces and rotate it along its 3 axes
- 4 different modes to choose from:
 - Solved cube so you can experiment with the cube
 - Easy scramble for those just getting started
 - Hard scramble for those with experience
 - Mr. K's scramble for Mr. Konstantinovich himself :)
- Timer to see how fast your solves are.


Update Log

2014-12-31
- Used the SpaceJunk Example to generate a colored cubex

2015-01-05
- Implemented (slightly) turning of two cubelets about an axis upon a key press. rotateZ is still glitched, however.
- Full Rubik's Cube created with black border.

2015-01-06
- Fixed annoying flickering issue on the cube.

2015-01-07
- U-Turn attempted to implement.
- The cube is now made to draw initially only once.

2015-01-08
- Fixed issue of cube not being centered on axes. (U-turn still not working properly. Still some bugs in cube rotations.)
- A PVector was used instead of shiftX.

2015-01-09
- Created an array for the cube's colors to check if the cube is solved.
- Bug fixed that made animation not appear; but doesn't run now with while loop.

2015-01-12
- Converted vertices to arrays of floats.
- Implementing a 3D array instead.
- New structure now works when rotating 1 degree at a time.

2015-01-13
- A right face turn was implemented.
- Center realigned to actual center; simultaneous turns and multiple turns taken care of.

2015-01-14
- Created a function that will swap the cubies correspondingly.
- All turns implemented, X rotation working.
- Black outline for cube working.
- All cube turns and cube rotations are now fully functional.
- Fixed a bug in which the nonvisible parts of the parts were also showing colors.
 2015-01-15
 - Function created to generate a random move sequence. The actual graphical scrambling is bugged, however.

2015-01-16
- Scramble generator fixed, fully works now.
- Implemented start screen with buttons for different scramble types.
- Control instructions added.

2015-01-17
- Return to menu button created.
- The 12 cube turns now change the colors array that will check for a solved position.
- Function to check for solved state added.

2015-01-18
- The program can now check if the cube is solved or not based up the moves done.

2015-01-19
- A congratulations message appears when the cube is solved.
- Stopwatch added for timing solves.