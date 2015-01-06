float angle; 

Cube[] cubes = new Cube[27];

void setup(){
  size(800, 400, P3D);
  background(255);
  noStroke();
  frameRate(300);
  
  cubes[0] = new Cube(30, 0, 0, 0);
  cubes[1] = new Cube(30, -45, -45, -45);
  cubes[2] = new Cube(30, 0, -45, -45);
  cubes[3] = new Cube(30, 45, -45, -45);
  cubes[4] = new Cube(30, -45, -45, 0);
  cubes[5] = new Cube(30, 0, -45, 0);
  cubes[6] = new Cube(30, 45, -45, 0);
  cubes[7] = new Cube(30, -45, -45, 45);
  cubes[8] = new Cube(30, 0, -45, 45);
  cubes[9] = new Cube(30, 45, -45, 45);
  cubes[10] = new Cube(30, -45, 0, -45);
  cubes[11] = new Cube(30, 0, 0, -45);
  cubes[12] = new Cube(30, 45, 0, -45);
  cubes[13] = new Cube(30, -45, 0, 0);
  cubes[14] = new Cube(30, 45, 0, 0);
  cubes[15] = new Cube(30, -45, 0, 45);
  cubes[16] = new Cube(30, 0, 0, 45);
  cubes[17] = new Cube(30, 45, 0, 45);
  cubes[18] = new Cube(30, -45, 45, -45);
  cubes[19] = new Cube(30, 0, 45, -45);
  cubes[20] = new Cube(30, 45, 45, -45);
  cubes[21] = new Cube(30, -45, 45, 0);
  cubes[22] = new Cube(30, 0, 45, 0);
  cubes[23] = new Cube(30, 45, 45, 0);
  cubes[24] = new Cube(30, -45, 45, 45);
  cubes[25] = new Cube(30, 0, 45, 45);
  cubes[26] = new Cube(30, 45, 45, 45);
  
}

void draw(){
  background(255);
  fill(0);
  
  translate(width/2, height/2);
  
  rotateZ(radians(angle));
  rotateY(radians(angle));
  rotateX(radians(angle));
  
  for(int i = 0; i < cubes.length; i++){
    cubes[i].drawCube();
  }
  
  angle += .1;
}
