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
Cube[] cubes = new Cube[27];

void pause(double time){
  println("tick");
  int t = millis();
  while (true) {
    if (millis() - t >= time) {
      println("tock");
      break;
    }
  }
}


void setup(){
  size(800, 400, P3D); 
  background(255); 
  noStroke();
  frameRate(60);
  anglex = 90;
  angley = 90;
  anglez = 90;
  initanglex = 0;
  initangley = 0;
  initanglez = 0;

  // Instantiate cubes, passing in random vals for size and postion
  //cubes[0] = new Cube(30, 30, 30, 0, 0, 0);
  //cubes[1] = new Cube(30, 30, 30, 200, 0, 0);

  cubes[0] = new Cube(30, -7.5, -7.5, -7.5);
  
  cubes[1] = new Cube(30, -52.5, -52.5, -52.5);
  cubes[2] = new Cube(30, -7.5, -52.5, -52.5);
  cubes[3] = new Cube(30, 37.5, -52.5, -52.5);
  cubes[4] = new Cube(30, -52.5, -52.5, -7.5);
  cubes[5] = new Cube(30, -7.5, -52.5, -7.5);
  cubes[6] = new Cube(30, 37.5, -52.5, -7.5);
  cubes[7] = new Cube(30, -52.5, -52.5, 37.5);
  cubes[8] = new Cube(30, -7.5, -52.5, 37.5);
  cubes[9] = new Cube(30, 37.5, -52.5, 37.5);
  cubes[10] = new Cube(30, -52.5, -7.5, -52.5);
  cubes[11] = new Cube(30, -7.5, -7.5, -52.5);
  cubes[12] = new Cube(30, 37.5, -7.5, -52.5);
  cubes[13] = new Cube(30, -52.5, -7.5, -7.5);
  cubes[14] = new Cube(30, 37.5, -7.5, -7.5);
  cubes[15] = new Cube(30, -52.5, -7.5, 37.5);
  cubes[16] = new Cube(30, -7.5, -7.5, 37.5);
  cubes[17] = new Cube(30, 37.5, -7.5, 37.5);
  cubes[18] = new Cube(30, -52.5, 37.5, -52.5);
  cubes[19] = new Cube(30, -7.5, 37.5, -52.5);
  cubes[20] = new Cube(30, 37.5, 37.5, -52.5);
  cubes[21] = new Cube(30, -52.5, 37.5, -7.5);
  cubes[22] = new Cube(30, -7.5, 37.5, -7.5);
  cubes[23] = new Cube(30, 37.5, 37.5, -7.5);
  cubes[24] = new Cube(30, -52.5, 37.5, 37.5);
  cubes[25] = new Cube(30, -7.5, 37.5, 37.5);
  cubes[26] = new Cube(30, 37.5, 37.5, 37.5);
  
}

void draw() {
  println(cubes[1].rot(new PVector(10,10,10),0,45));
  background(157,157,157);
  fill(200);
  translate(width/2, height/2, 100);
  rotateX(radians(-40));
  rotateY(radians(-40));
  if (asdf == 0) {
    for (int i = 0; i < cubes.length; i++) {
      cubes[i].drawCube();
      if (i == cubes.length - 1) {
        asdf = 1;
      }
    }
  }

  if (anglex < 90 && rotatedy && rotatedz) {
    anglex++;
  } else {
    rotatedx = true;
  }

  if (angley < 90 && rotatedx && rotatedz) {
    angley++;
  } else {
    rotatedy = true;
  }

  if (anglez < 90 && rotatedx && rotatedy) {
    anglez++;
  } else {
    rotatedz = true;
  }


  for (int i = 0; i < cubes.length; i++) {
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
  println("rotatedx: " + rotatedx);
  println("rotatedy: " + rotatedy);
  println("rotatedz: " + rotatedz);
  println(key);
  if (rotatedx && rotatedy && rotatedz) {
    if (key == 'i') {
      anglex = 0;
      initanglex++;
      rotatedx = false;
    } else if (key == 'h') {
      angley = 0;
      initangley++;
      rotatedy = false;
    } else if (key == 'f') {
      anglez = 0;
      initanglez++;
      rotatedz = false;
    } else if (key == 'u') {
      Uturn();
    }
  }
}


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
}

void Uturn() {
  int[][] matrix = { 
    {
      1, 3, 9, 7
    } 
    , {
      2, 6, 8, 4
    }
  };

  for (int k = 0; k < 90; k++) {
    //delay(10);
    for (int[] i : matrix) {
      for (int j : i) {
        pushMatrix();
        rotateY(radians(k));
        cubes[j].drawCube();
        popMatrix();
      }
    }
  }
  swap(matrix);
}

