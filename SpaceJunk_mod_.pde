/**
 * Space Junk  
 * by Ira Greenberg (zoom suggestion by Danny Greenberg).
 * 
 * Rotating cubes in space using a custom Cube class. 
 * Color controlled by light sources. Move the mouse left
 * and right to zoom.
 */

// Used for oveall rotation
float angle;

// Cube count-lower/raise to test performance
int limit = 1;

// Array for all cubes
Cube[] cubes = new Cube[limit];

void setup() {
  size(640, 360, P3D); 
  background(0); 
  noStroke();

  // Instantiate cubes, passing in random vals for size and postion
  cubes[0] = new Cube(30, 30, 30, 0, 0, 0);
}

void draw(){
  background(0); 
  fill(200);

  // Set up some different colored lights


  // Raise overall light in scene 
  ambientLight(70, 70, 10); 

  // Center geometry in display windwow.
  // you can changlee 3rd argument ('0')
  // to move block group closer(+) / further(-)
  translate(width/2, height/2, -200 + mouseX * 0.65);

  // Rotate around y and x axes
  rotateX(radians(angle));
  rotateY(radians(angle));

  // Draw cubes
  for (int i = 0; i < cubes.length; i++){
    cubes[i].drawCube();
  }
  
  // Used in rotate function calls above
  angle += 0.2;
}


