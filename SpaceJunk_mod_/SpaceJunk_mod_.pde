/**
 * Virtual Rubik's Cube
 * By Peter Strbik and Brandon Lin
 * 
 * Credits go to the Space Junk example for allowing
 * us to create the cubelets.
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

  if(anglex < 90 && rotatedy && rotatedz){
    anglex++;
  }else{
    rotatedx = true;
  }
  
  if(angley < 90 && rotatedx && rotatedz){
    angley++;
  }else{
    rotatedy = true;
  }
  
  if(anglez < 90 && rotatedx && rotatedy){
    anglez++;
  }else{
    rotatedz = true;
  }
  
  
  for (int i = 0; i < cubes.length; i++){
    pushMatrix();
    rotateX(radians(initanglex*90));
    rotateX(radians(anglex));
    rotateY(radians(initangley*90));
    rotateY(radians(angley));
    rotateZ(radians(initanglez*90));
    rotateZ(radians(anglez));
    cubes[i].drawCube();
    popMatrix();
  }
}

void keyPressed() {
  if(rotatedx && rotatedy && rotatedz){
    if(key == 'i'){
      anglex = 0;
      initanglex++;
      rotatedx = false;
    }else if(key == 'h'){
      angley = 0;
      initangley++;
      rotatedy = false;
    }else if(key == 'f'){
      anglez = 0;
      initanglez++;
      rotatedz = false;
    }
  }
  
}

