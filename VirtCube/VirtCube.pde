/**
 * Virtual Rubik's Cube
 * By Peter Strbik and Brandon Lin
 * 
 * Credits go to the Space Junk example for allowing
 * us to create the cubelets.
 */

// Used for oveall rotation
int angle = 0;
boolean stable = true, checkSolve = false;
char F;

// Array for all cubes
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


// Pauses the animation
static void pause(int n) {
  try {
    Thread.sleep(1000 * n);
  }
  catch(InterruptedException e) {
    Thread.currentThread().interrupt();
  }
}

// Sets up the cube 
void setup() {
  size(800, 400, P3D);
  background(255); 
  strokeWeight(10); //give the cube its black border
  translate(width/2, height/2, 100);
  rotateX(radians(-40));
  rotateY(radians(-40));
  
  // boolean arrays to choose to color the face of a cubelet or not
  boolean[] WBO = {true, false, true, false, true, false};
  boolean[] WB = {true, false, false, false, true, false};
  boolean[] WBR = {true, false, false, true, true, false};
  boolean[] WO = {false, false, true, false, true, false};
  boolean[] WC = {false, false, false, false, true, false};
  boolean[] WR = {false, false, false, true, true, false};
  boolean[] WGO = {false, true, true, false, true, false};
  boolean[] WG = {false, true, false, false, true, false};
  boolean[] WGR = {false, true, false, true, true, false};
  boolean[] BO = {true, false, true, false, false, false};
  boolean[] BC = {true, false, false, false, false, false};
  boolean[] BR = {true, false, false, true, false, false};
  boolean[] OC = {false, false, true, false, false, false};
  boolean[] CORE = {false, false, false, false, false, false};
  boolean[] RC = {false, false, false, true, false, false};
  boolean[] GO = {false, true, true, false, false, false};
  boolean[] GC = {false, true, false, false, false, false};
  boolean[] GR = {false, true, false, true, false, false};
  boolean[] YBO = {true, false, true, false, false, true};
  boolean[] YB = {true, false, false, false, false, true};
  boolean[] YBR = {true, false, false, true, false, true};
  boolean[] YO = {false, false, true, false, false, true};
  boolean[] YC = {false, false, false, false, false, true};
  boolean[] YR = {false, false, false, true, false, true};
  boolean[] YGO = {false, true, true, false, false, true};
  boolean[] YG = {false, true, false, false, false, true};
  boolean[] YGR = {false, true, false, true, false, true};
  boolean[][] lister = { WBO, WB, WBR, WO, WC, WR, WGO, WG, WGR, BO, BC, BR, OC, CORE, RC, GO, GC, GR, YBO, YB, YBR, YO, YC, YR, YGO, YG, YGR };
  int m = 0;
  
  for(int j = -1; j < 2; j++){
    for(int k = -1; k < 2; k++){
      for(int i = -1; i < 2; i++){
        cubes[j+1][k+1][i+1] = new Cube(30, (45 * i) - 7.5, (45 * j) - 7.5, (45 * k) - 7.5, lister[m]);
        m++;
      }
    }
  }
  drawAllCubes();
}

// main draw method
void draw() {
  background(157, 157, 157);
  fill(200);
  translate(width/2, height/2, 100);
  rotateX(radians(-40));
  rotateY(radians(-40));
  drawAllCubes();
  turn(); // draw the cubes, then check to see if we can continue turning the cubelets
}

// draws all the cubelets in the cube
void drawAllCubes() {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      for (int k = 0; k < 3; k++) {
        cubes[i][j][k].drawCube();
      }
    }
  }
}

// Performs the designated move based on key press
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
  case 'l':
    LTurn(-1);
    break;
  case 'L':
    LTurn(1);
    break;
  case 'd':
    DTurn(-1);
    break;
  case 'D':
    DTurn(1);
    break;
  case 'b':
    BTurn(-1);
    break;
  case 'B':
    BTurn(1);
    break;
  case 'x':
    XRot(1);
    break;
  case 'X':
    XRot(-1);
    break;
  case 'y':
    YRot(-1);
    break;
  case 'Y':
    YRot(1);
    break;
  case 'z':
    ZRot(-1);
    break;
  case 'Z':
    ZRot(1);
    break;
  }
}

// translates key pressed into face turn
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
    } else if (key == 'd') {
      stable = false;
      F = 'l';
    } else if (key == 'e') {
      stable = false;
      F = 'L';
    } else if (key == 's') {
      stable = false;
      F = 'd';
    } else if (key == 'l') {
      stable = false;
      F = 'D';
    } else if (key == 'w') {
      stable = false;
      F = 'b';
    } else if (key == 'o') {
      stable = false;
      F = 'B';
    } else if (key == 'y' || key == 't') {
      stable = false;
      F = 'x';
    } else if (key == 'b' || key == 'n') {
      stable = false;
      F = 'X';
    } else if (key == ';') {
      stable = false;
      F = 'y';
    } else if (key == 'a') {
      stable = false;
      F = 'Y';
    } else if (key == 'p') {
      stable = false;
      F = 'z';
    } else if (key == 'q') {
      stable = false;
      F = 'Z';
    }
  }
}

// swaps the cubelets in "cubes" to be rotated
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

// will do the actual rotating; change the position of each cube
void move(char var, int face, int dir) {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      for (int k = 0; k < 3; k++) {
        if (var == 'i' && i == face) {
          switch(dir) {
          case -1: 
            cubes[i][j][k].rotCubie(1, -6); 
            break;
          case 1: 
            cubes[i][j][k].rotCubie(1, 6); 
            break;
          }
        } else if (var == 'j' && j == face) {
          switch(dir) {
          case -1: 
            cubes[i][j][k].rotCubie(2, 6); 
            break;
          case 1: 
            cubes[i][j][k].rotCubie(2, -6); 
            break;
          }
        } else if (var == 'k' && k == face) {
          switch(dir) {
          case -1: 
            cubes[i][j][k].rotCubie(0, -6); 
            break;
          case 1: 
            cubes[i][j][k].rotCubie(0, 6); 
            break;
          }
        }
      }
    }
  }
}

// Right face
void RTurn(int dir) {
  if (angle < 15 && !stable) {
    move('k', 2, dir);
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

// Up face
void UTurn(int dir) {
  if (angle < 15 && !stable) {
    move('i', 0, -dir);
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

// Down face
void FTurn(int dir) {
  if (angle < 15 && !stable) {
    move('j', 2, -dir);
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

// Left face
void LTurn(int dir) {
  if (angle < 15 && !stable) {
    move('k', 0, dir);
    angle++;
  } else {
    int[] mat = { 
      2, 2, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1, 0, 1, 2, 0, 2, 1, 0, 1, 0, 0
    };
    if (dir == -1) {
      int[] swap = {
        0, 2, 0, 0, 0, 0, 2, 0, 0, 2, 2, 0, 1, 0, 0, 2, 1, 0, 1, 2, 0, 0, 1, 0
      };
      mat = swap;
    } 
    swapFace(mat);
    angle = 0;
    F = '~';
    stable = true;
  }
}

// Down face
void DTurn(int dir) {
  if (angle < 15 && !stable) {
    move('i', 2, -dir);
    angle++;
  } else {
    int[] mat = {
      2, 0, 0, 2, 2, 0, 2, 2, 2, 2, 0, 2, 2, 1, 0, 2, 2, 1, 2, 1, 2, 2, 0, 1
    };
    if (dir == -1) {
      int[] swap = { 
        2, 0, 2, 2, 2, 2, 2, 2, 0, 2, 0, 0, 2, 0, 1, 2, 1, 2, 2, 2, 1, 2, 1, 0
      };
      mat = swap;
    }
    swapFace(mat);
    angle = 0;
    F = '~';
    stable = true;
  }
}

// Back face
void BTurn(int dir) {
  if (angle < 15 && !stable) {
    move('j', 0, -dir);
    angle++;
  } else {
    int[] mat = {
      0, 0, 0, 2, 0, 0, 2, 0, 2, 0, 0, 2, 0, 0, 1, 1, 0, 0, 2, 0, 1, 1, 0, 2
    };
    if (dir == -1) {
      int[] swap = { 
        0, 0, 2, 2, 0, 2, 2, 0, 0, 0, 0, 0, 1, 0, 2, 2, 0, 1, 1, 0, 0, 0, 0, 1
      };
      mat = swap;
    }
    swapFace(mat);
    angle = 0;
    F = '~';
    stable = true;
  }
}

// X Rotation (rotation along left and right faces)
void XRot(int dir) {
  if (angle < 15 && !stable) {
    for (int i = 0; i < 3; i++) {
      move('k', i, dir);
    }
    angle++;
  } else {
    for (int i = 0; i < 3; i++) {
      int[] mat = { 
        2, 2, i, 2, 0, i, 0, 0, i, 0, 2, i, 0, 1, i, 1, 2, i, 2, 1, i, 1, 0, i
      };
      if (dir == -1) {
        int[] swap = {
          0, 2, i, 0, 0, i, 2, 0, i, 2, 2, i, 1, 0, i, 2, 1, i, 1, 2, i, 0, 1, i
        };
        mat = swap;
      }
      swapFace(mat);
    }
    angle = 0;
    F = '~';
    stable = true;
  }
}

// Y Rotation (rotation along up and down faces)
void YRot(int dir) {
  if (angle < 15 && !stable) {
    for (int i = 0; i < 3; i++) {
      move('i', i, dir);
    }
    angle++;
  } else {
    for (int i = 0; i < 3; i++) {
      int[] mat = { 
        i, 0, 2, i, 2, 2, i, 2, 0, i, 0, 0, i, 0, 1, i, 1, 2, i, 2, 1, i, 1, 0
      };
      if (dir == -1) {
        int[] swap = {
          i, 0, 0, i, 2, 0, i, 2, 2, i, 0, 2, i, 1, 0, i, 2, 1, i, 1, 2, i, 0, 1
        };
        mat = swap;
      }
      swapFace(mat);
    }
    angle = 0;
    F = '~';
    stable = true;
  }
}

// Z Rotation (rotation along front and back faces)
void ZRot(int dir) {
  if (angle < 15 && !stable) {
    for (int i = 0; i < 3; i++) {
      move('j', i, dir);
    }
    angle++;
  } else {
    for (int i = 0; i < 3; i++) {
      int[] mat = { 
        0, i, 2, 2, i, 2, 2, i, 0, 0, i, 0, 1, i, 2, 2, i, 1, 1, i, 0, 0, i, 1
      };
      if (dir == -1) {
        int[] swap = {
          0, i, 0, 2, i, 0, 2, i, 2, 0, i, 2, 0, i, 1, 1, i, 0, 2, i, 1, 1, i, 2
        };
        mat = swap;
      }
      swapFace(mat);
    }
    angle = 0;
    F = '~';
    stable = true;
  }
}

