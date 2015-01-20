/**
 * Virtual Rubik's Cube
 * By Peter Strbik and Brandon Lin
 * 
 * Credits go to the Space Junk example for allowing
 * us to create the cubelets.
 */

// Used for overall rotation
import java.util.*;
int angle = 0, stage = 0;
boolean stable = true, checkSolve = false, scrambling = false, started = false;;
ArrayList<Character> scramble = new ArrayList<Character>();
char F;
int startTime, endTime;
String REALCONTROLS = "Controls:\nj/f Top face\ns/l Bottom face\ni/k Right face\nd/e Left face\nh/g Front face\nw/o Back face\nt,y/b,n Cube Rotation (x-axis)\na/; Cube Rotation (y-axis)\np/q Cube Rotation (z-axis)";
String NUBCONTROLS = "Controls:\n1/! Top face\n2/@ Bottom face\n3/# Right face\n4/$ Left face\n5/% Front face\n6/^ Back face\n7/& Cube Rotation (a-axis)\n8/* Cube Rotation (y-axis)\n9/( Cube Rotation (z-axis)";
char[] controlnub = {'1','!','2','@','3','#','4','$','5','%','6','^','7','&','8','*','9','('};
char[] controlrealman = {'j','f','s','l','d','e','i','k','h','g','w','o','y','b',';','a','p','q'};
char[] controls = controlrealman;
boolean nubControls = false;
PImage img;
boolean MrKScramble, displayFace;
int startFaceTime;

// Array for all cubes
Cube[][][] cubes = new Cube[3][3][3];

// Array for colors
int[][] colors;


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
  MrKScramble = false;
  displayFace = false;
  
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
  boolean[][] lister = { 
    WBO, WB, WBR, WO, WC, WR, WGO, WG, WGR, BO, BC, BR, OC, CORE, RC, GO, GC, GR, YBO, YB, YBR, YO, YC, YR, YGO, YG, YGR
  };
  int m = 0;
  img = loadImage("unnamed.png");

  for (int j = -1; j < 2; j++) {
    for (int k = -1; k < 2; k++) {
      for (int i = -1; i < 2; i++) {
        cubes[j+1][k+1][i+1] = new Cube(30, (45 * i) - 7.5, (45 * j) - 7.5, (45 * k) - 7.5, lister[m]);
        m++;
      }
    }
  }
  
  colors = new int[][] {{0,0,0,0,0,0,0,0,0},{1,1,1,1,1,1,1,1,1},{2,2,2,2,2,2,2,2,2},{3,3,3,3,3,3,3,3,3},{4,4,4,4,4,4,4,4,4},{5,5,5,5,5,5,5,5,5}};
  started = false;
}

// main draw method
void draw() {
  background(157, 157, 157);
  fill(200);
  if(stage == 0){
    textAlign(CENTER);
    textSize(32);
    text("Choose your mode", 400,50);
    strokeWeight(5);
    rect(10,100,380,120); //Solved
    rect(10,250,380,120); //Easy
    rect(400,100,380,120); //Hard
    rect(400,250,380,120); //Mr.K
    fill(0,102,153);
    text("Solved Cube", 200,150);
    text("Easy Scramble",200,300);
    text("Hard Scramble",600,150);
    text("Mr. K's Scramble",600,300);
  }else if(stage == 1){
    fill(255,255,255);
    textSize(16);
    if (nubControls){
      text(NUBCONTROLS,650,100);
    }
    else{
      text(REALCONTROLS,650,100);
    }
    strokeWeight(5);
    rect(10, 290, 200, 100);
    rect(10, 10, 100, 50); //Nub Controls
    rect(10, 80, 100, 50); //Real-Man Controls
    fill(0, 102, 153);
    textSize(20);
    text("Return to \nMenu", 105, 330);
    textSize(14);
    text("Nub Controls", 60, 40);
    text("Real-Man \nControls", 60, 100);
    strokeWeight(10);
    translate(width/2, height/2, 100);
    rotateX(radians(-40));
    rotateY(radians(-40));
    drawAllCubes();
    turn();
    if(checkSolve && checkSolved() && MrKScramble){
      println("You solved it!");
      endTime = millis();
      stage = 3;
    }
    else if (checkSolve && checkSolved()){
      println("You solved it!");
      endTime = millis();
      stage = 2;
    }
  } else if(stage == 2) {
      fill(255,255,255);
      strokeWeight(5);
      rect(10, 290, 200, 100);
      fill(0, 102, 153);
      textSize(20);
      text("Return to \nMenu", 105, 330);
      textSize(48);
      text("You\nsolved\nit\n in " + ((float)(endTime - startTime) / 1000) + " \nseconds!", 675,50);
      strokeWeight(10);
      translate(width/2, height/2, 100);
      rotateX(radians(-40));
      rotateY(radians(-40));
      drawAllCubes();
    
    }
    else if (stage == 3){
      if (!displayFace){
        startFaceTime = millis();
        displayFace = true;
      }
      image(img, 0, 0, width, height);
      if (millis() - startFaceTime > 2000){
        stage = 2;
      }
    }
      
  }




void colorSwapperHelper(int start, int end, int[] m){
  int temp = colors[m[start]][m[start+1]];
  for(int i = start; i < end-2; i+= 2){
    colors[m[i]][m[i+1]] = colors[m[i+2]][m[i+3]];
  }
  colors[m[end-2]][m[end-1]] = temp;
}

void colorSwapper(int[] m){
  for(int i = 0; i < 40; i+= 8){
    colorSwapperHelper(i,i+8,m);
  }
}
  
  

void mouseClicked(){
  if (stage == 0){
    if(mouseX <= 390 && mouseX >= 10 && mouseY <= 240 && mouseY >= 100){
      stage = 1;
    }
    else if (mouseX <= 390 && mouseX >= 10 && mouseY <= 370 && mouseY >= 250){
      scrambleEasy();
      stage = 1;
      checkSolve = true;
    }
    else if (mouseX <= 780 && mouseX >= 400 && mouseY <= 240 && mouseY >= 100){
      scrambleNormal();
      stage = 1;
      checkSolve = true;
    }
    else if (mouseX <= 780 && mouseX >= 400 && mouseY <= 370 && mouseY >= 250){
      scrambleMrK();
      stage = 1;
      checkSolve = true;
      MrKScramble = true;
    }
  }
  else if (stage >= 1){
    if (mouseX <= 210 && mouseX >= 10 && mouseY <= 390 && mouseY >= 290){
      stage = 0;
      resetCube();
      checkSolve = false;
    }
    else if (mouseX <= 110 && mouseX >= 10 && mouseY <= 60 && mouseY >= 10){
      nubControls = true;
      controls = controlnub;
    }
    else if (mouseX <= 110 && mouseX >= 10 && mouseY <= 130 && mouseY >= 80){
      nubControls = false;
      controls = controlrealman;
    }
  }  
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
  if (stable && stage == 1) {
    if (key == controls[0]) {
      stable = false;
      F = 'u';
    } else if (key == controls[1]) {
      stable = false;
      F = 'U';
    } else if (key == controls[2]) {
      stable = false;
      F = 'd';
    } else if (key == controls[3]) {
      stable = false;
      F = 'D';
    } else if (key == controls[4]) {
      stable = false;
      F = 'l';
    } else if (key == controls[5]) {
      stable = false;
      F = 'L';
    } else if (key == controls[6]) {
      stable = false;
      F = 'r';
    } else if (key == controls[7]) {
      stable = false;
      F = 'R';
    } else if (key == controls[8]) {
      stable = false;
      F = 'f';
    } else if (key == controls[9]) {
      stable = false; 
      F = 'F';
    } else if (key == controls[10]) {
      stable = false;
      F = 'b';
    } else if (key == controls[11]) {
      stable = false;
      F = 'B';
    } else if (key == controls[12]) {
      stable = false;
      F = 'x';
    } else if (key == controls[13]) {
      stable = false;
      F = 'X';
    } else if (key == controls[14]) {
      stable = false;
      F = 'y';
    } else if (key == controls[15]) {
      stable = false;
      F = 'Y';
    } else if (key == controls[16]) {
      stable = false;
      F = 'z';
    } else if (key == controls[17]) {
      stable = false;
      F = 'Z';
    } else if (key == 't' && !nubControls){
      stable = false;
      F = 'x';
    } else if (key == 'n' && !nubControls){
      stable = false;
      F = 'X';
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
    if(!started){
      started = true;
      startTime = millis();
    }
  } else {
    int[] mat = { 
      2, 2, 2, 2, 0, 2, 0, 0, 2, 0, 2, 2, 0, 1, 2, 1, 2, 2, 2, 1, 2, 1, 0, 2
    };
    int[] mat2 = {3,2,3,0,3,6,3,8,3,7,3,5,3,1,3,3,0,8,4,8,1,8,5,0,0,5,4,5,1,5,5,3,0,2,4,2,1,2,5,6};
    if (dir == -1) {
      int[] swap = {
        0, 2, 2, 0, 0, 2, 2, 0, 2, 2, 2, 2, 1, 0, 2, 2, 1, 2, 1, 2, 2, 0, 1, 2
      };
      mat = swap;
      int[] swap2 = {3,8,3,6,3,0,3,2,3,3,3,1,3,5,3,7,5,0,1,8,4,8,0,8,5,3,1,5,4,5,0,5,5,6,1,2,4,2,0,2};
      mat2 = swap2;
    } 
    swapFace(mat);
    colorSwapper(mat2);
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
    if(!started){
      started = true;
      startTime = millis();
    }
  } else {
    int[] mat = {
      0, 0, 0, 0, 2, 0, 0, 2, 2, 0, 0, 2, 0, 1, 0, 0, 2, 1, 0, 1, 2, 0, 0, 1
    };
    int[] mat2 = {0,2,0,0,0,6,0,8,0,7,0,5,0,1,0,3,3,0,5,0,2,0,4,0,3,2,5,2,2,2,4,2,3,1,5,1,2,1,4,1};
    if (dir == -1) {
      int[] swap = { 
        0, 0, 2, 0, 2, 2, 0, 2, 0, 0, 0, 0, 0, 0, 1, 0, 1, 2, 0, 2, 1, 0, 1, 0
      };
      mat = swap;
      int[] swap2 = {0,8,0,6,0,0,0,2,0,3,0,1,0,5,0,7,4,0,2,0,5,0,3,0,4,2,2,2,5,2,3,2,4,1,2,1,5,1,3,1};
      mat2 = swap2;
    }
    swapFace(mat);
    colorSwapper(mat2);
    
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
    if(!started){
      started = true;
      startTime = millis();
    }
  } else {
    int[] mat = {
      0, 2, 0, 2, 2, 0, 2, 2, 2, 0, 2, 2, 0, 2, 1, 1, 2, 0, 2, 2, 1, 1, 2, 2
    };
    int[] mat2 = {4,2,4,0,4,6,4,8,4,7,4,5,4,1,4,3,0,6,2,8,1,2,3,0,2,2,1,0,3,6,0,8,2,5,1,1,3,3,0,7};
    if (dir == -1) {
      int[] swap = { 
        0, 2, 2, 2, 2, 2, 2, 2, 0, 0, 2, 0, 1, 2, 2, 2, 2, 1, 1, 2, 0, 0, 2, 1
      };
      mat = swap;
      int[] swap2 = {4,8,4,6,4,0,4,2,4,3,4,1,4,5,4,7,3,0,1,2,2,8,0,6,0,8,3,6,1,0,2,2,0,7,3,3,1,1,2,5};
      mat2 = swap2;
    }
    swapFace(mat);
    colorSwapper(mat2);
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
    if(!started){
      started = true;
      startTime = millis();
    }
  } else {
    int[] mat = { 
      2, 2, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 1, 0, 1, 2, 0, 2, 1, 0, 1, 0, 0
    };
    int[] mat2 = {2,8,2,6,2,0,2,2,2,3,2,1,2,5,2,7,0,6,4,6,1,6,5,2,0,0,4,0,1,0,5,8,0,3,4,3,1,3,5,5};
    if (dir == -1) {
      int[] swap = {
        0, 2, 0, 0, 0, 0, 2, 0, 0, 2, 2, 0, 1, 0, 0, 2, 1, 0, 1, 2, 0, 0, 1, 0
      };
      mat = swap;
      int[] swap2 = {2,2,2,0,2,6,2,8,2,7,2,5,2,1,2,3,5,2,1,6,4,6,0,6,5,8,1,0,4,0,0,0,5,5,1,3,4,3,0,3};
      mat2 = swap2;
    } 
    swapFace(mat);
    colorSwapper(mat2);
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
    if(!started){
      started = true;
      startTime = millis();
    }
  } else {
    int[] mat = {
      2, 0, 0, 2, 2, 0, 2, 2, 2, 2, 0, 2, 2, 1, 0, 2, 2, 1, 2, 1, 2, 2, 0, 1
    };
    int[] mat2 = {1,8,1,6,1,0,1,2,1,3,1,1,1,5,1,7,3,7,5,7,2,7,4,7,3,6,5,6,2,6,4,6,3,8,5,8,2,8,4,8};
    if (dir == -1) {
      int[] swap = { 
        2, 0, 2, 2, 2, 2, 2, 2, 0, 2, 0, 0, 2, 0, 1, 2, 1, 2, 2, 2, 1, 2, 1, 0
      };
      mat = swap;
      int[] swap2 = {1,2,1,0,1,6,1,8,1,7,1,5,1,1,1,3,4,7,2,7,5,7,3,7,4,6,2,6,5,6,3,6,4,8,2,8,5,8,3,8};
      mat2 = swap2;
    }
    swapFace(mat);
    colorSwapper(mat2);
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
    if(!started){
      started = true;
      startTime = millis();
    }
  } else {
    int[] mat = {
      0, 0, 0, 2, 0, 0, 2, 0, 2, 0, 0, 2, 0, 0, 1, 1, 0, 0, 2, 0, 1, 1, 0, 2
    };
    int[] mat2 = {5,8,5,6,5,0,5,2,5,3,5,1,5,5,5,7,0,2,2,0,1,6,3,8,3,2,0,0,2,6,1,8,0,1,2,3,1,7,3,5};
    if (dir == -1) {
      int[] swap = { 
        0, 0, 2, 2, 0, 2, 2, 0, 0, 0, 0, 0, 1, 0, 2, 2, 0, 1, 1, 0, 0, 0, 0, 1
      };
      mat = swap;
      int[] swap2 = {5,2,5,0,5,6,5,8,5,7,5,5,5,1,5,3,3,8,1,6,2,0,0,2,1,8,2,6,0,0,3,2,3,5,1,7,2,3,0,1};
      mat2 = swap2;
    }
    swapFace(mat);
    colorSwapper(mat2);
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
    if(dir == 1){
      colorSwapper(new int[] {3,2,3,0,3,6,3,8,3,7,3,5,3,1,3,3,0,8,4,8,1,8,5,0,0,5,4,5,1,5,5,3,0,2,4,2,1,2,5,6});
      colorSwapper(new int[] {2,8,2,6,2,0,2,2,2,3,2,1,2,5,2,7,0,6,4,6,1,6,5,2,0,0,4,0,1,0,5,8,0,3,4,3,1,3,5,5});
      colorSwapper(new int[] {0,4,4,4,1,4,5,4,0,7,4,7,1,7,5,1,0,1,4,1,1,1,5,7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0});
    }else{
      colorSwapper(new int[] {3,8,3,6,3,0,3,2,3,3,3,1,3,5,3,7,5,0,1,8,4,8,0,8,5,3,1,5,4,5,0,5,5,6,1,2,4,2,0,2});
      colorSwapper(new int[] {2,2,2,0,2,6,2,8,2,7,2,5,2,1,2,3,5,2,1,6,4,6,0,6,5,8,1,0,4,0,0,0,5,5,1,3,4,3,0,3});
      colorSwapper(new int[] {5,4,1,4,4,4,0,4,5,1,1,7,4,7,0,7,5,7,1,1,4,1,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0});
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
    if(dir == 1){
      colorSwapper(new int[] {0,8,0,6,0,0,0,2,0,3,0,1,0,5,0,7,4,0,2,0,5,0,3,0,4,2,2,2,5,2,3,2,4,1,2,1,5,1,3,1});
      colorSwapper(new int[] {1,2,1,0,1,6,1,8,1,7,1,5,1,1,1,3,4,7,2,7,5,7,3,7,4,6,2,6,5,6,3,6,4,8,2,8,5,8,3,8});
      colorSwapper(new int[] {2,3,5,3,3,3,4,3,2,5,5,5,3,5,4,5,2,4,5,4,3,4,4,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0});
    }else{
      colorSwapper(new int[] {0,2,0,0,0,6,0,8,0,7,0,5,0,1,0,3,3,0,5,0,2,0,4,0,3,2,5,2,2,2,4,2,3,1,5,1,2,1,4,1});
      colorSwapper(new int[] {1,8,1,6,1,0,1,2,1,3,1,1,1,5,1,7,3,7,5,7,2,7,4,7,3,6,5,6,2,6,4,6,3,8,5,8,2,8,4,8});
      colorSwapper(new int[] {4,3,3,3,5,3,2,3,4,5,3,5,5,5,2,5,4,4,3,4,5,4,2,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0});
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
    if(dir == 1){
      colorSwapper(new int[] {4,8,4,6,4,0,4,2,4,3,4,1,4,5,4,7,3,0,1,2,2,8,0,6,0,8,3,6,1,0,2,2,0,7,3,3,1,1,2,5});
      colorSwapper(new int[] {5,2,5,0,5,6,5,8,5,7,5,5,5,1,5,3,3,8,1,6,2,0,0,2,1,8,2,6,0,0,3,2,3,5,1,7,2,3,0,1});
      colorSwapper(new int[] {3,1,1,5,2,7,0,3,3,7,1,3,2,1,0,5,3,4,1,4,2,4,0,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0});
    }else{
      colorSwapper(new int[] {4,2,4,0,4,6,4,8,4,7,4,5,4,1,4,3,0,6,2,8,1,2,3,0,2,2,1,0,3,6,0,8,2,5,1,1,3,3,0,7});
      colorSwapper(new int[] {5,8,5,6,5,0,5,2,5,3,5,1,5,5,5,7,0,2,2,0,1,6,3,8,3,2,0,0,2,6,1,8,0,1,2,3,1,7,3,5});
      colorSwapper(new int[] {0,3,2,7,1,5,3,1,0,5,2,1,1,3,3,7,0,4,2,4,1,4,3,4,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0});
    }
    angle = 0;
    F = '~';
    stable = true;
  }
}

void randMove() {
  int m = int(random(12));
  switch(m) {
  case 0: 
    scramble.add('u'); 
    break;
  case 1: 
    scramble.add('U'); 
    break;
  case 2: 
    scramble.add('d'); 
    break;
  case 3: 
    scramble.add('D'); 
    break;
  case 4: 
    scramble.add('l'); 
    break;
  case 5: 
    scramble.add('L'); 
    break;
  case 6: 
    scramble.add('r'); 
    break;
  case 7: 
    scramble.add('R'); 
    break;
  case 8: 
    scramble.add('f'); 
    break;
  case 9: 
    scramble.add('F'); 
    break;
  case 10: 
    scramble.add('b'); 
    break;
  case 11: 
    scramble.add('B'); 
    break;
  }
}

void scrambleAssist(char c){
  while(!stable){
    switch(c){
      case 'r': stable = false; RTurn(1); break;
      case 'R': stable = false; RTurn(-1); break;
      case 'u': stable = false; UTurn(1); break;
      case 'U': stable = false; UTurn(-1); break;
      case 'f': stable = false; FTurn(1); break;
      case 'F': stable = false; FTurn(-1); break;
      case 'l': stable = false; LTurn(-1); break;
      case 'L': stable = false; LTurn(1); break;
      case 'd': stable = false; DTurn(-1); break;
      case 'D': stable = false; DTurn(1); break;
      case 'b': stable = false; BTurn(-1); break;
      case 'B': stable = false; BTurn(1); break;
    }
  }
  stable = false;
}

// this part is almost working, can this be fixed?
void scramble(int length) {
  scrambling = true;
  scramble.clear();
  for (int i = 0; i < length; i++) {
    randMove();
  }
  for (char c : scramble) {
    scrambleAssist(c);
  }
  F = '~';
  stable = true;
}

void scrambleEasy(){
  scramble(6);
}

void scrambleNormal(){
  scramble(50);
}

void scrambleMrK(){
  scramble(2);
}

void resetCube(){
  setup();
}

boolean checkSolved(){
  for(int i = 0; i < colors.length; i++){
    for(int j = 0; j < colors[i].length - 1; j++){
      if(colors[i][j] != colors[i][j+1]){
        return false;
      }
    }
  }
  return true;
}
