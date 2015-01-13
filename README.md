FINAL PROJECT FOR APCS
====

==
By Peter Strbik and Brandon Lin

==
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

OUR PLAN

We plan to make a virtual Rubik's Cube controlled by the keyboard.

The basic mechanism behind this:
We have 2 arrays.
- The first array is a linear array of size 26 that contains the different cubelets. This will allow us to see which cubelets will be rotated upon a turn.
- The second array is a 2-dimensional array (int[6][9]) that contains the various colors of each face. This will allow us to see if the puzzle is solved or not.

In our examples, the following key will be used:
White - 1
Yellow - 2
Orange - 3
Red - 4
Green - 5
Blue - 6

For example, using the scramble

R F' B2 D' B U2 F' L' D B' U2 F2 D2 F' R2 B R2 F' U2 R2

the following 2D Array is generated (columns represent the sticker position according to VisualCube's position, rows represent the face value according to the order specified by Kociemba's Algorithm):

  0 1 2 3 4 5 6 7 8
U 5 4 1 6 1 4 4 2 1
D 2 6 3 1 2 1 1 1 5
L 2 3 1 2 3 5 6 5 4
R 5 1 4 4 4 6 6 3 4
F 5 3 3 3 5 2 6 2 2
B 6 5 3 4 6 5 2 6 3

Every cubelet is assigned an integer value from 1 to 26. Each turn and rotation, corresponding to a matching key on the keyboard, will switch the corresponding cubelets in the linear array and the corresponding colors in the 2D Array.

Now for the graphics aspect. Each cubelet will be derived from an abstract class Cubelet, which has the subclasses Corner, Edge, and Center. These cubelets will be exactly the same, except for how they are oriented on the cube and which stickers are colored.

Our only problem now is to figure out how to animate the turning of the cubelets simultaneously to make it look like an actually turning Rubik's Cube.
