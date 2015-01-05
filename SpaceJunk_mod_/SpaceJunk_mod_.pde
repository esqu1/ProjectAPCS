/**
 * Space Junk  
 * by Ira Greenberg (zoom suggestion by Danny Greenberg).
 * 
 * Rotating cubes in space using a custom Cube class. 
 * Color controlled by light sources. Move the mouse left
 * and right to zoom.
 */

// Used for oveall rotation
int anglex = 90, initanglex, angley = 90, initangley,anglez,initanglez;
boolean rotated = true;

// Cube count-lower/raise to test performance
int limit = 2;

// Array for all cubes
Cube[] cubes = new Cube[limit];

void setup() {
  size(640, 360, P3D); 
  background(0); 
  noStroke();

  // Instantiate cubes, passing in random vals for size and postion
  cubes[0] = new Cube(30, 30, 30, 0, 0, 0);
  cubes[1] = new Cube(30, 30, 30, 200, 0, 0);
}

void draw(){
  background(0); 
  fill(200);
  translate(width/2, height/2, -200 + mouseX * 0.65);

  if(anglex < 90){
    anglex++;
  }else{
    rotated = true;
  }
  
  if(angley < 90){
    angley++;
  }else{
    rotated = true;
  }
  
  
  rotate(radians(initanglex*90));
  rotate(radians(anglex));
  rotate(radians(initangley*90));
  rotate(radians(angley));
  for (int i = 0; i < cubes.length; i++){
    cubes[i].drawCube();
  }
}

void keyPressed() {
  println(rotated);
  if(rotated){
    if(key == 'h'){
      anglex = 0;
      initanglex++;
    }else if(key == 'i'){
      angley = 0;
      initangley++;
    }
  }
  rotated = false;
}

