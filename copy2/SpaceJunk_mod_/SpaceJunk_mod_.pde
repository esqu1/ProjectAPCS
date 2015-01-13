/**
 * Virtual Rubik's Cube
 * By Peter Strbik and Brandon Lin
 * 
 * Credits go to the Space Junk example for allowing
 * us to create the cubelets.
 */

// Used for oveall rotation
int anglex, initanglex, angley, initangley, anglez, initanglez;
boolean rotatedx = true, rotatedy = true, rotatedz = true;
int asdf = 0;

// Array for all cubes
//Cube[] cubes = new Cube[27];
Cube[][][] cubes = new Cube[3][3][3];

// Array for colors
int[][] colors = {
  { 
    1, 1, 1, 1, 1, 1, 1, 1, 1
  }
  , 
  { 
    2, 2, 2, 2, 2, 2, 2, 2, 2
  }
  , 
  { 
    3, 3, 3, 3, 3, 3, 3, 3, 3
  }
  , 
  { 
    4, 4, 4, 4, 4, 4, 4, 4, 4
  }
  , 
  { 
    5, 5, 5, 5, 5, 5, 5, 5, 5
  }
  , 
  { 
    6, 6, 6, 6, 6, 6, 6, 6, 6
  }
};

public static void pause(int n) {
  try {
    Thread.sleep(1000 * n);
  }
  catch(InterruptedException e) {
    Thread.currentThread().interrupt();
  }
}


void setup() {
  size(800, 400, P3D);
  background(255); 
  noStroke();
  anglex = 90;
  angley = 90;
  anglez = 90;
  initanglex = 0;
  initangley = 0;
  initanglez = 0;
  translate(width/2, height/2, 100);
  rotateX(radians(-40));
  rotateY(radians(-40));
  
  for(int i = -1; i < 2; i++){
    for(int j = -1; j < 2; j++){
      for(int k = -1; k < 2; k++){
        cubes[i+1][j+1][k+1] = new Cube(30,45*i,45*j,45*k);
      }
    }
  }
   
  drawAllCubes();

  
}

void draw() {
  background(157, 157, 157);
  fill(200);
  translate(width/2, height/2, 100);
  rotateX(radians(-40));
  rotateY(radians(-40));

  drawAllCubes();
}

void drawAllCubes(){
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 3; j++){
      for(int k = 0; k < 3; k++){
        cubes[i][j][k].drawCube();
      }
    }
  }
}

void keyPressed() {
  println("rotatedx: " + rotatedx);
  println("rotatedy: " + rotatedy);
  println("rotatedz: " + rotatedz);
  println(key);
  if (rotatedx && rotatedy && rotatedz) {
    if (key == 'i') {
      rotX(0);
    } else if (key == 'h') {
      angley = 0; 
      initangley++; 
      rotatedy = false;
    } else if (key == 'f') {
      anglez = 0; 
      initanglez++; 
      rotatedz = false;
    } else if (key == 'u') {
      //Uturn();
    }
  }
}

/*
void swap(int[][] swapper) {
  Cube temp = cubes[swapper[0][0]]; 
  cubes[swapper[0][0]] = cubes[swapper[0][1]]; 
  cubes[swapper[0][1]] = cubes[swapper[0][2]]; 
  cubes[swapper[0][2]] = cubes[swapper[0][3]]; 
  cubes[swapper[0][3]] = temp; 
  Cube temp2 = cubes[swapper[1][0]]; 
  cubes[swapper[1][0]] = cubes[swapper[1][1]]; 
  cubes[swapper[1][1]] = cubes[swapper[1][2]]; 
  cubes[swapper[1][2]] = cubes[swapper[1][3]]; 
  cubes[swapper[1][3]] = temp2;
}*/


// Problem: the cubes will not be rotated; their orientation stays the same.
void RTurn(int dir) {
  if(anglex < 90){
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        for(int k = 0; k < 3; k++){
          if(i == 2){
            cubes[i][j][k].rotCubie(0,1);         
          } 
        }
      }
    }
  }else{
      anglex = 0;
  }
}



