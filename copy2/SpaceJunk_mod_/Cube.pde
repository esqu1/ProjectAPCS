public class Cube {
  color black = color(0, 0, 0);  
  color green = color(0, 255, 0);
  color red = color(255, 0, 0);
  color blue = color(0, 0, 255);
  color yellow = color(255, 255, 0);
  color white = color(255, 255, 255);
  color orange = color(255, 162, 0);
  int sideLength;
  PVector p;
  float rotationX, rotationY, rotationZ;
  float[] vertex1 = new float[3];
  float[] vertex2 = new float[3];
  float[] vertex3 = new float[3];
  float[] vertex4 = new float[3];
  float[] vertex5 = new float[3];
  float[] vertex6 = new float[3];
  float[] vertex7 = new float[3];
  float[] vertex8 = new float[3];

  
  

  Cube(int sideLength, float shiftX, float shiftY, float shiftZ) {
    this.sideLength = sideLength;
    this.p = new PVector(shiftX, shiftY, shiftZ);
    updatePos(p);
  }
  
  void updatePos(PVector lol){
    this.vertex1[0] = -sideLength/2 + lol.x; this.vertex1[1] = -sideLength/2 + lol.y; this.vertex1[2]= -sideLength/2 + lol.z;
    this.vertex2[0] = sideLength + lol.x;    this.vertex2[1] = -sideLength/2 + lol.y; this.vertex2[2] = -sideLength/2 + lol.z;
    this.vertex3[0] = sideLength + lol.x;    this.vertex3[1] = -sideLength/2 + lol.y; this.vertex3[2] =  sideLength + lol.z;
    this.vertex4[0] = -sideLength/2 + lol.x; this.vertex4[1] = -sideLength/2 + lol.y; this.vertex4[2] = sideLength + lol.z;
    this.vertex5[0] = -sideLength/2 + lol.x; this.vertex5[1] = sideLength + lol.y;    this.vertex5[2] = -sideLength/2 + lol.z;
    this.vertex6[0] = sideLength + lol.x;    this.vertex6[1] = sideLength + lol.y;    this.vertex6[2] = -sideLength/2 + lol.z;
    this.vertex7[0] = sideLength + lol.x;    this.vertex7[1] = sideLength + lol.y;    this.vertex7[2] = sideLength + lol.z;
    this.vertex8[0] = -sideLength/2 + lol.x; this.vertex8[1] = sideLength + lol.y;    this.vertex8[2] = sideLength + lol.z;
  }
    
  void drawCube() {
    beginShape(QUADS);
    //Back 
    fill(blue);
    vertex(vertex1[0],vertex1[1],vertex1[2]);
    vertex(vertex2[0],vertex2[1],vertex2[2]);
    vertex(vertex6[0],vertex6[1],vertex6[2]);
    vertex(vertex5[0],vertex5[1],vertex5[2]);

    //fill(blue);
    //vertex(-sideLength/2 + p.x + (0.1 * sideLength), -sideLength/2 + p.y + (0.1 * sideLength), -sideLength/2 + p.z - .01);
    //vertex(sideLength + p.x - (0.1 * sideLength), -sideLength/2 + p.y + (0.1 * sideLength), -sideLength/2 + p.z - .01);
    //vertex(sideLength + p.x - (0.1 * sideLength), sideLength + p.y - (0.1 * sideLength), -sideLength/2 + p.z - .01);
    //vertex(-sideLength/2 + p.x + (0.1 * sideLength), sideLength + p.y - (0.1 * sideLength), -sideLength/2 + p.z - .01);

    //Front 
    fill(green);
    vertex(vertex4[0],vertex4[1],vertex4[2]);
    vertex(vertex3[0],vertex3[1],vertex3[2]);
    vertex(vertex7[0],vertex7[1],vertex7[2]);
    vertex(vertex8[0],vertex8[1],vertex8[2]);

    //fill(green);
    //vertex(-sideLength/2 + p.x  + (0.1 * sideLength), -sideLength/2 + p.y  + (0.1 * sideLength), sideLength + p.z + .01);
    //vertex(sideLength + p.x  - (0.1 * sideLength), -sideLength/2 + p.y  + (0.1 * sideLength), sideLength + p.z + .01);
    //vertex(sideLength + p.x  - (0.1 * sideLength), sideLength + p.y  - (0.1 * sideLength), sideLength + p.z + .01);
    //vertex(-sideLength/2 + p.x  + (0.1 * sideLength), sideLength + p.y  - (0.1 * sideLength), sideLength + p.z + .01);

    //Left
    fill(orange);
    vertex(vertex1[0],vertex1[1],vertex1[2]);
    vertex(vertex4[0],vertex4[1],vertex4[2]);
    vertex(vertex8[0],vertex8[1],vertex8[2]);
    vertex(vertex5[0],vertex5[1],vertex5[2]);

    //fill(orange);
    //vertex(-sideLength/2 + p.x - .01, -sideLength/2 + p.y + (0.1 * sideLength), -sideLength/2 + p.z + (0.1 * sideLength));
    //vertex(-sideLength/2 + p.x - .01, -sideLength/2 + p.y + (0.1 * sideLength), sideLength + p.z - (0.1 * sideLength));
    //vertex(-sideLength/2 + p.x - .01, sideLength + p.y - (0.1 * sideLength), sideLength + p.z - (0.1 * sideLength));
    //vertex(-sideLength/2 + p.x - .01, sideLength + p.y - (0.1 * sideLength), -sideLength/2 + p.z + (0.1 * sideLength));

    //Right
    fill(red);
    vertex(vertex2[0],vertex2[1],vertex2[2]);
    vertex(vertex3[0],vertex3[1],vertex3[2]);
    vertex(vertex7[0],vertex7[1],vertex7[2]);
    vertex(vertex6[0],vertex6[1],vertex6[2]);

    //fill(red);
    //vertex(sideLength + p.x + .01, -sideLength/2 + p.y + (0.1 * sideLength), -sideLength/2 + p.z + (0.1 * sideLength));
    //vertex(sideLength + p.x + .01, -sideLength/2 + p.y + (0.1 * sideLength), sideLength + p.z - (0.1 * sideLength));
    //vertex(sideLength + p.x + .01, sideLength + p.y - (0.1 * sideLength), sideLength + p.z - (0.1 * sideLength));
    //vertex(sideLength + p.x + .01, sideLength + p.y - (0.1 * sideLength), -sideLength/2 + p.z + (0.1 * sideLength));

    //Top
    fill(white);
    vertex(vertex1[0],vertex1[1],vertex1[2]);
    vertex(vertex2[0],vertex2[1],vertex2[2]);
    vertex(vertex3[0],vertex3[1],vertex3[2]);
    vertex(vertex4[0],vertex4[1],vertex4[2]);

    //fill(white);
    //vertex(-sideLength/2 + p.x  + (0.1 * sideLength), -sideLength/2 + p.y - .01, -sideLength/2 + p.z  + (0.1 * sideLength));
    //vertex(sideLength + p.x - (0.1 * sideLength), -sideLength/2 + p.y - .01, -sideLength/2 + p.z  + (0.1 * sideLength));
    //vertex(sideLength + p.x - (0.1 * sideLength), -sideLength/2 + p.y - .01, sideLength + p.z - (0.1 * sideLength));
    //vertex(-sideLength/2 + p.x  + (0.1 * sideLength), -sideLength/2 + p.y - .01, sideLength + p.z - (0.1 * sideLength));

    //Bottom
    fill(yellow);
    vertex(vertex5[0],vertex5[1],vertex5[2]);
    vertex(vertex6[0],vertex6[1],vertex6[2]);
    vertex(vertex7[0],vertex7[1],vertex7[2]);
    vertex(vertex8[0],vertex8[1],vertex8[2]);

    //fill(yellow);
    //vertex(-sideLength/2 + p.x + (0.1 * sideLength), sideLength + p.y + .01, -sideLength/2 + p.z + (0.1 * sideLength));
    //vertex(sideLength + p.x - (0.1 * sideLength), sideLength + p.y + .01, -sideLength/2 + p.z + (0.1 * sideLength));
    //vertex(sideLength + p.x - (0.1 * sideLength), sideLength + p.y + .01, sideLength + p.z - (0.1 * sideLength));
    //vertex(-sideLength/2 + p.x + (0.1 * sideLength), sideLength + p.y + .01, sideLength + p.z - (0.1 * sideLength));

    endShape();
  }

  void rot(int axis, float angle) {
    if (axis == 0) {      
      p = new PVector(p.x, p.y*cos(radians(angle)) - p.z*sin(radians(angle)), p.y*sin(radians(angle)) + p.z*cos(radians(angle)));
    } else if (axis == 1) {
      p = new PVector(p.x*cos(radians(angle)) + p.z*sin(radians(angle)), p.y, -p.x*sin(radians(angle)) + p.z*cos(radians(angle)));
    } else {
      p = new PVector(p.x*cos(radians(angle)) - p.y*sin(radians(angle)), p.x*sin(radians(angle))+p.y*cos(radians(angle)),p.z);
    }
    updatePos(p);
  }
  
  void rotCubie(int axis, float angle){
    float[] v1 = new float[]{vertex1[0], vertex1[1], vertex1[2]};
    float[] v2 = new float[]{vertex2[0], vertex2[1], vertex2[2]};
    float[] v3 = new float[]{vertex3[0], vertex3[1], vertex3[2]};
    float[] v4 = new float[]{vertex4[0], vertex4[1], vertex4[2]};
    float[] v5 = new float[]{vertex5[0], vertex5[1], vertex5[2]};
    float[] v6 = new float[]{vertex6[0], vertex6[1], vertex6[2]};
    float[] v7 = new float[]{vertex7[0], vertex7[1], vertex7[2]};
    float[] v8 = new float[]{vertex8[0], vertex8[1], vertex8[2]};
    //x-axis rotation
    if (axis == 0){
      vertex1[1] = v1[1]*cos(radians(angle)) - v1[2]*sin(radians(angle));    vertex1[2] = v1[1]*sin(radians(angle)) + v1[2]*cos(radians(angle));
      vertex2[1] = v2[1]*cos(radians(angle)) - v2[2]*sin(radians(angle));    vertex2[2] = v2[1]*sin(radians(angle)) + v2[2]*cos(radians(angle));
      vertex3[1] = v3[1]*cos(radians(angle)) - v3[2]*sin(radians(angle));    vertex3[2] = v3[1]*sin(radians(angle)) + v3[2]*cos(radians(angle));
      vertex4[1] = v4[1]*cos(radians(angle)) - v4[2]*sin(radians(angle));    vertex4[2] = v4[1]*sin(radians(angle)) + v4[2]*cos(radians(angle));
      vertex5[1] = v5[1]*cos(radians(angle)) - v5[2]*sin(radians(angle));    vertex5[2] = v5[1]*sin(radians(angle)) + v5[2]*cos(radians(angle));
      vertex6[1] = v6[1]*cos(radians(angle)) - v6[2]*sin(radians(angle));    vertex6[2] = v6[1]*sin(radians(angle)) + v6[2]*cos(radians(angle));
      vertex7[1] = v7[1]*cos(radians(angle)) - v7[2]*sin(radians(angle));    vertex7[2] = v7[1]*sin(radians(angle)) + v7[2]*cos(radians(angle));
      vertex8[1] = v8[1]*cos(radians(angle)) - v8[2]*sin(radians(angle));    vertex8[2] = v8[1]*sin(radians(angle)) + v8[2]*cos(radians(angle));
    }else if(axis == 1){
      vertex1[0] = v1[0]*cos(radians(angle)) + v1[2]*sin(radians(angle));    vertex1[2] = v1[2]*cos(radians(angle)) - v1[0]*sin(radians(angle));
      vertex2[0] = v2[0]*cos(radians(angle)) + v2[2]*sin(radians(angle));    vertex2[2] = v2[2]*cos(radians(angle)) - v2[0]*sin(radians(angle));
      vertex3[0] = v3[0]*cos(radians(angle)) + v3[2]*sin(radians(angle));    vertex3[2] = v3[2]*cos(radians(angle)) - v3[0]*sin(radians(angle));
      vertex4[0] = v4[0]*cos(radians(angle)) + v4[2]*sin(radians(angle));    vertex4[2] = v4[2]*cos(radians(angle)) - v4[0]*sin(radians(angle));
      vertex5[0] = v5[0]*cos(radians(angle)) + v5[2]*sin(radians(angle));    vertex5[2] = v5[2]*cos(radians(angle)) - v5[0]*sin(radians(angle));
      vertex6[0] = v6[0]*cos(radians(angle)) + v6[2]*sin(radians(angle));    vertex6[2] = v6[2]*cos(radians(angle)) - v6[0]*sin(radians(angle));
      vertex7[0] = v7[0]*cos(radians(angle)) + v7[2]*sin(radians(angle));    vertex7[2] = v7[2]*cos(radians(angle)) - v7[0]*sin(radians(angle));
      vertex8[0] = v8[0]*cos(radians(angle)) + v8[2]*sin(radians(angle));    vertex8[2] = v8[2]*cos(radians(angle)) - v8[0]*sin(radians(angle));
    }else if(axis == 2){
      //oops i broke this section
      vertex1[0] = v1[0]*cos(radians(angle)) - v1[1]*sin(radians(angle));    vertex1[1] = v1[0]*sin(radians(angle)) + v1[1]*cos(radians(angle));
      vertex2[0] = v2[0]*cos(radians(angle)) - v2[1]*sin(radians(angle));    vertex2[1] = v2[0]*sin(radians(angle)) + v2[1]*cos(radians(angle));
      vertex3[0] = v3[0]*cos(radians(angle)) - v3[1]*sin(radians(angle));    vertex3[1] = v3[0]*sin(radians(angle)) + v3[1]*cos(radians(angle));
      vertex4[0] = v4[0]*cos(radians(angle)) - v4[1]*sin(radians(angle));    vertex4[1] = v4[0]*sin(radians(angle)) + v4[1]*cos(radians(angle));
      vertex5[0] = v5[0]*cos(radians(angle)) - v5[1]*sin(radians(angle));    vertex5[1] = v5[0]*sin(radians(angle)) + v5[1]*cos(radians(angle));
      vertex6[0] = v6[0]*cos(radians(angle)) - v6[1]*sin(radians(angle));    vertex6[1] = v6[0]*sin(radians(angle)) + v6[1]*cos(radians(angle));
      vertex7[0] = v7[0]*cos(radians(angle)) - v7[1]*sin(radians(angle));    vertex7[1] = v7[0]*sin(radians(angle)) + v7[1]*cos(radians(angle));
      vertex8[0] = v8[0]*cos(radians(angle)) - v8[1]*sin(radians(angle));    vertex8[1] = v8[0]*sin(radians(angle)) + v8[1]*cos(radians(angle));
    }
  }
      
  
}


