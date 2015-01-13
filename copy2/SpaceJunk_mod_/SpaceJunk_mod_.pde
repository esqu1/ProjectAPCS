/**
 * Virtual Rubik's Cube
 * By Peter Strbik and Brandon Lin
 * 
 * Credits go to the Space Junk example for allowing
 * us to create the cubelets.
 */

// Used for oveall rotation
int angler, initangler, angleu, initangleu, anglez, initanglez;
boolean rotatedx = true, rotatedy = true, rotatedz = true;
int asdf = 0;
char F;

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
  angler = 0;
  angleu = 0;
  anglez = 0;
  initangler = 0;
  initangleu = 0;
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
  
  turn();
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

void turn(){
  println(F);
  switch(F){
    case 'r': RTurn(0); break;
    case 'u': UTurn(0); break;
  }
}

void keyPressed() {
  println("rotatedx: " + rotatedx);
  println("rotatedy: " + rotatedy);
  println("rotatedz: " + rotatedz);
  println(key);
  if (rotatedx && rotatedy && rotatedz) {
    if (key == 'i') {
      F = 'r';
    } else if (key == 'j') {
      F = 'u';
    } else if (key == 'f') {
      anglez = 0; 
      initanglez++; 
      rotatedz = false;
    } else if (key == 'u') {
      UTurn(0);
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

void RTurn(int dir) {
  if(angler < 90){
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        for(int k = 0; k < 3; k++){
          if(i == 2){
            cubes[i][j][k].rotCubie(0,1);         
          } 
        }
      }
    }
    angler++;
  }else{
      angler = 0;
      F = '~';
  }
}

void UTurn(int dir) {
  if(angleu < 90){
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        for(int k = 0; k < 3; k++){
          if(j == 0){
            cubes[i][j][k].rotCubie(1,1);
          } 
        }
      }
    }
    angleu++;
  }else{
      angleu = 0;
      F = '~';
  }
}


