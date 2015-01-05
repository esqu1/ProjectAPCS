/**
 * Space Junk  
 * by Ira Greenberg (zoom suggestion by Danny Greenberg).
 * 
 * Rotating cubes in space using a custom Cube class. 
 * Color controlled by light sources. Move the mouse left
 * and right to zoom.
 */

// Used for oveall rotation
int anglex, initanglex, angley, initangley,anglez,initanglez;
boolean rotatedx = true, rotatedy = true, rotatedz = true;

// Cube count-lower/raise to test performance
int limit = 2;

// Array for all cubes
Cube[] cubes = new Cube[limit];

void setup() {
  size(640, 360, P3D); 
  background(0); 
  noStroke();
  anglex = 90;
  angley = 90;
  anglez = 90;
  initanglex = 0;
  initangley = 0;
  initanglez = 0;

  // Instantiate cubes, passing in random vals for size and postion
  cubes[0] = new Cube(30, 30, 30, 0, 0, 0);
  cubes[1] = new Cube(30, 30, 30, 200, 0, 0);
}

void draw(){
  background(157,157,157); 
  fill(200);
  translate(width/2, height/2, -200 + mouseX * 0.65);

  if(anglex < 90 && rotatedy){
    anglex++;
  }else{
    rotatedx = true;
  }
  
  if(angley < 90 && rotatedx){
    angley++;
  }else{
    rotatedy = true;
  }
  
  
  
  for (int i = 0; i < cubes.length; i++){
    pushMatrix();
    rotateX(radians(initanglex*90));
    rotateX(radians(anglex));
    rotateY(radians(initangley*90));
    rotateY(radians(angley));
    cubes[i].drawCube();
    popMatrix();
  }
}

void keyPressed() {
  println(rotatedx);
  if(rotatedx && rotatedy && rotatedz){
    if(key == 'i'){
      anglex = 0;
      initanglex++;
      rotatedx = false;
    }else if(key == 'h'){
      angley = 0;
      initangley++;
      rotatedy = false;
    }
  }
  
}

