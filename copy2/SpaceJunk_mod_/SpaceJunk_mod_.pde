/**
 * Virtual Rubik's Cube
 * By Peter Strbik and Brandon Lin
 * 
 * Credits go to the Space Junk example for allowing
 * us to create the cubelets.
 */

// Used for oveall rotation
int angle;
boolean rotatedx = true, rotatedy = true, rotatedz = true, stable = true, checkSolve = false;
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
  angle = 0;
  translate(width/2, height/2, 100);
  rotateX(radians(-40));
  rotateY(radians(-40));
  /*
  for (int i = -1; i < 2; i++) {
   for (int j = -1; j < 2; j++) {
   for (int k = -1; k < 2; k++) {
   cubes[i+1][j+1][k+1] = new Cube(30, 45*i, 45*j, 45*k);
   }
   }
   }
   */
  cubes[0][0][0] = new Cube(30, -52.5, -52.5, -52.5);
  cubes[0][0][1] = new Cube(30, -7.5, -52.5, -52.5);
  cubes[0][0][2] = new Cube(30, 37.5, -52.5, -52.5);
  cubes[0][1][0] = new Cube(30, -52.5, -52.5, -7.5);
  cubes[0][1][1] = new Cube(30, -7.5, -52.5, -7.5);
  cubes[0][1][2] = new Cube(30, 37.5, -52.5, -7.5);
  cubes[0][2][0] = new Cube(30, -52.5, -52.5, 37.5);
  cubes[0][2][1] = new Cube(30, -7.5, -52.5, 37.5);
  cubes[0][2][2] = new Cube(30, 37.5, -52.5, 37.5);
  cubes[1][0][0] = new Cube(30, -52.5, -7.5, -52.5);
  cubes[1][0][1] = new Cube(30, -7.5, -7.5, -52.5);
  cubes[1][0][2] = new Cube(30, 37.5, -7.5, -52.5);
  cubes[1][1][0] = new Cube(30, -52.5, -7.5, -7.5);
  cubes[1][1][1] = new Cube(30, -7.5, -7.5, -7.5);
  cubes[1][1][2] = new Cube(30, 37.5, -7.5, -7.5);
  cubes[1][2][0] = new Cube(30, -52.5, -7.5, 37.5);
  cubes[1][2][1] = new Cube(30, -7.5, -7.5, 37.5);
  cubes[1][2][2] = new Cube(30, 37.5, -7.5, 37.5);
  cubes[2][0][0] = new Cube(30, -52.5, 37.5, -52.5);
  cubes[2][0][1] = new Cube(30, -7.5, 37.5, -52.5);
  cubes[2][0][2] = new Cube(30, 37.5, 37.5, -52.5);
  cubes[2][1][0] = new Cube(30, -52.5, 37.5, -7.5);
  cubes[2][1][1] = new Cube(30, -7.5, 37.5, -7.5);
  cubes[2][1][2] = new Cube(30, 37.5, 37.5, -7.5);
  cubes[2][2][0] = new Cube(30, -52.5, 37.5, 37.5);
  cubes[2][2][1] = new Cube(30, -7.5, 37.5, 37.5);
  cubes[2][2][2] = new Cube(30, 37.5, 37.5, 37.5);

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

void drawAllCubes() {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      for (int k = 0; k < 3; k++) {
        cubes[i][j][k].drawCube();
      }
    }
  }
}

void turn() {
  switch(F) {
  case 'r': 
    RTurn(1); 
    break;
  case 'R': 
    RTurn(-1); 
    break;
  case 'u': 
    UTurn(1); 
    break;
  case 'U':
    UTurn(-1);
    break;
  case 'f':
    FTurn(1);
    break;
  case 'F':
    FTurn(-1);
    break;
  }
}

void keyPressed() {
  if (stable) {
    if (key == 'i') {
      stable = false;
      F = 'r';
    } else if (key == 'j') {
      stable = false;
      F = 'u';
    } else if (key == 'k') {
      stable = false;
      F = 'R';
    } else if (key == 'f') {
      stable = false;
      F = 'U';
    } else if (key == 'h') {
      stable = false;
      F = 'f';
    } else if (key == 'g') {
      stable = false; 
      F = 'F';
    }
  }
}

void swapFace(int[] l) {
  Cube temp = cubes[l[0]][l[1]][l[2]];
  cubes[l[0]][l[1]][l[2]] = cubes[l[3]][l[4]][l[5]];
  cubes[l[3]][l[4]][l[5]] = cubes[l[6]][l[7]][l[8]];
  cubes[l[6]][l[7]][l[8]] = cubes[l[9]][l[10]][l[11]];
  cubes[l[9]][l[10]][l[11]] = temp;
  Cube temp2 = cubes[l[12]][l[13]][l[14]];
  cubes[l[12]][l[13]][l[14]] = cubes[l[15]][l[16]][l[17]];
  cubes[l[15]][l[16]][l[17]] = cubes[l[18]][l[19]][l[20]];
  cubes[l[18]][l[19]][l[20]] = cubes[l[21]][l[22]][l[23]];
  cubes[l[21]][l[22]][l[23]] = temp2;
}

void move(char var, int face, int dir) {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      for (int k = 0; k < 3; k++) {
        if (var == 'i' && i == face) {
          switch(dir) {
          case -1: 
            cubes[i][j][k].rotCubie(1, -3); 
            break;
          case 1: 
            cubes[i][j][k].rotCubie(1, 3); 
            break;
          }
        } else if (var == 'j' && j == face) {
          switch(dir) {
          case -1: 
            cubes[i][j][k].rotCubie(2, 3); 
            break;
          case 1: 
            cubes[i][j][k].rotCubie(2, -3); 
            break;
          }
        } else if (var == 'k' && k == face) {
          switch(dir) {
          case -1: 
            cubes[i][j][k].rotCubie(0, -3); 
            break;
          case 1: 
            cubes[i][j][k].rotCubie(0, 3); 
            break;
          }
        }
      }
    }
  }
}


void RTurn(int dir) {
  if (angle < 30 && !stable) {
    move('k',2,dir);
    angle++;
  } else {
    int[] mat = { 
      2, 2, 2, 2, 0, 2, 0, 0, 2, 0, 2, 2, 0, 1, 2, 1, 2, 2, 2, 1, 2, 1, 0, 2
    };
    if (dir == -1) {
      int[] swap = {
        0, 2, 2, 0, 0, 2, 2, 0, 2, 2, 2, 2, 1, 0, 2, 2, 1, 2, 1, 2, 2, 0, 1, 2
      };
      mat = swap;
    } 
    swapFace(mat);
    angle = 0;
    F = '~';
    stable = true;
  }
}

void UTurn(int dir) {
  if (angle < 30 && !stable) {
    move('i',0,-dir);
    angle++;
  } else {
    int[] mat = {
      0, 0, 0, 0, 2, 0, 0, 2, 2, 0, 0, 2, 0, 1, 0, 0, 2, 1, 0, 1, 2, 0, 0, 1
    };
    if (dir == -1) {
      int[] swap = { 
        0, 0, 2, 0, 2, 2, 0, 2, 0, 0, 0, 0, 0, 0, 1, 0, 1, 2, 0, 2, 1, 0, 1, 0
      };
      mat = swap;
    }
    swapFace(mat);
    angle = 0;
    F = '~';
    stable = true;
  }
}

void FTurn(int dir) {
  if (angle < 30 && !stable) {
    move('j',2,-dir);
    angle++;
  } else {
    int[] mat = {
      0, 2, 0, 2, 2, 0, 2, 2, 2, 0, 2, 2, 0, 2, 1, 1, 2, 0, 2, 2, 1, 1, 2, 2
    };
    if (dir == -1) {
      int[] swap = { 
        0, 2, 2, 2, 2, 2, 2, 2, 0, 0, 2, 0, 1, 2, 2, 2, 2, 1, 1, 2, 0, 0, 2, 1
      };
      mat = swap;
    }
    swapFace(mat);
    angle = 0;
    F = '~';
    stable = true;
  }
}

