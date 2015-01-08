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

  Cube(int sideLength, float shiftX, float shiftY, float shiftZ) {
    this.sideLength = sideLength;
    this.p = new PVector(shiftX, shiftY, shiftZ);
  }


  void drawCube() {
    beginShape(QUADS);
    //Back 
    fill(black);
    vertex(-sideLength/2 + p.x, -sideLength/2 + p.y, -sideLength/2 + p.z);
    vertex(sideLength + p.x, -sideLength/2 + p.y, -sideLength/2 + p.z);
    vertex(sideLength + p.x, sideLength + p.y, -sideLength/2 + p.z);
    vertex(-sideLength/2 + p.x, sideLength + p.y, -sideLength/2 + p.z);

    fill(blue);
    vertex(-sideLength/2 + p.x + (0.1 * sideLength), -sideLength/2 + p.y + (0.1 * sideLength), -sideLength/2 + p.z - .01);
    vertex(sideLength + p.x - (0.1 * sideLength), -sideLength/2 + p.y + (0.1 * sideLength), -sideLength/2 + p.z - .01);
    vertex(sideLength + p.x - (0.1 * sideLength), sideLength + p.y - (0.1 * sideLength), -sideLength/2 + p.z - .01);
    vertex(-sideLength/2 + p.x + (0.1 * sideLength), sideLength + p.y - (0.1 * sideLength), -sideLength/2 + p.z - .01);

    //Front 
    fill(black);
    vertex(-sideLength/2 + p.x, -sideLength/2 + p.y, sideLength + p.z);
    vertex(sideLength + p.x, -sideLength/2 + p.y, sideLength + p.z);
    vertex(sideLength + p.x, sideLength + p.y, sideLength + p.z);
    vertex(-sideLength/2 + p.x, sideLength + p.y, sideLength + p.z);

    fill(green);
    vertex(-sideLength/2 + p.x  + (0.1 * sideLength), -sideLength/2 + p.y  + (0.1 * sideLength), sideLength + p.z + .01);
    vertex(sideLength + p.x  - (0.1 * sideLength), -sideLength/2 + p.y  + (0.1 * sideLength), sideLength + p.z + .01);
    vertex(sideLength + p.x  - (0.1 * sideLength), sideLength + p.y  - (0.1 * sideLength), sideLength + p.z + .01);
    vertex(-sideLength/2 + p.x  + (0.1 * sideLength), sideLength + p.y  - (0.1 * sideLength), sideLength + p.z + .01);

    //Left
    fill(black);
    vertex(-sideLength/2 + p.x, -sideLength/2 + p.y, -sideLength/2 + p.z);
    vertex(-sideLength/2 + p.x, -sideLength/2 + p.y, sideLength + p.z);
    vertex(-sideLength/2 + p.x, sideLength + p.y, sideLength + p.z);
    vertex(-sideLength/2 + p.x, sideLength + p.y, -sideLength/2 + p.z);

    fill(orange);
    vertex(-sideLength/2 + p.x - .01, -sideLength/2 + p.y + (0.1 * sideLength), -sideLength/2 + p.z + (0.1 * sideLength));
    vertex(-sideLength/2 + p.x - .01, -sideLength/2 + p.y + (0.1 * sideLength), sideLength + p.z - (0.1 * sideLength));
    vertex(-sideLength/2 + p.x - .01, sideLength + p.y - (0.1 * sideLength), sideLength + p.z - (0.1 * sideLength));
    vertex(-sideLength/2 + p.x - .01, sideLength + p.y - (0.1 * sideLength), -sideLength/2 + p.z + (0.1 * sideLength));

    //Right
    fill(black);
    vertex(sideLength + p.x, -sideLength/2 + p.y, -sideLength/2 + p.z);
    vertex(sideLength + p.x, -sideLength/2 + p.y, sideLength + p.z);
    vertex(sideLength + p.x, sideLength + p.y, sideLength + p.z);
    vertex(sideLength + p.x, sideLength + p.y, -sideLength/2 + p.z);

    fill(red);
    vertex(sideLength + p.x + .01, -sideLength/2 + p.y + (0.1 * sideLength), -sideLength/2 + p.z + (0.1 * sideLength));
    vertex(sideLength + p.x + .01, -sideLength/2 + p.y + (0.1 * sideLength), sideLength + p.z - (0.1 * sideLength));
    vertex(sideLength + p.x + .01, sideLength + p.y - (0.1 * sideLength), sideLength + p.z - (0.1 * sideLength));
    vertex(sideLength + p.x + .01, sideLength + p.y - (0.1 * sideLength), -sideLength/2 + p.z + (0.1 * sideLength));

    //Top
    fill(black);
    vertex(-sideLength/2 + p.x, -sideLength/2 + p.y, -sideLength/2 + p.z);
    vertex(sideLength + p.x, -sideLength/2 + p.y, -sideLength/2 + p.z);
    vertex(sideLength + p.x, -sideLength/2 + p.y, sideLength + p.z);
    vertex(-sideLength/2 + p.x, -sideLength/2 + p.y, sideLength + p.z);

    fill(white);
    vertex(-sideLength/2 + p.x  + (0.1 * sideLength), -sideLength/2 + p.y - .01, -sideLength/2 + p.z  + (0.1 * sideLength));
    vertex(sideLength + p.x - (0.1 * sideLength), -sideLength/2 + p.y - .01, -sideLength/2 + p.z  + (0.1 * sideLength));
    vertex(sideLength + p.x - (0.1 * sideLength), -sideLength/2 + p.y - .01, sideLength + p.z - (0.1 * sideLength));
    vertex(-sideLength/2 + p.x  + (0.1 * sideLength), -sideLength/2 + p.y - .01, sideLength + p.z - (0.1 * sideLength));

    //Bottom
    fill(black);
    vertex(-sideLength/2 + p.x, sideLength + p.y, -sideLength/2 + p.z);
    vertex(sideLength + p.x, sideLength + p.y, -sideLength/2 + p.z);
    vertex(sideLength + p.x, sideLength + p.y, sideLength + p.z);
    vertex(-sideLength/2 + p.x, sideLength + p.y, sideLength + p.z);

    fill(yellow);
    vertex(-sideLength/2 + p.x + (0.1 * sideLength), sideLength + p.y + .01, -sideLength/2 + p.z + (0.1 * sideLength));
    vertex(sideLength + p.x - (0.1 * sideLength), sideLength + p.y + .01, -sideLength/2 + p.z + (0.1 * sideLength));
    vertex(sideLength + p.x - (0.1 * sideLength), sideLength + p.y + .01, sideLength + p.z - (0.1 * sideLength));
    vertex(-sideLength/2 + p.x + (0.1 * sideLength), sideLength + p.y + .01, sideLength + p.z - (0.1 * sideLength));

    endShape();
  }

  PVector rot(PVector o, int axis, int angle) {
    PVector x = new PVector(0, 0, 0);
    if (axis == 0) {      
      return new PVector(o.x, o.y*cos(radians(angle)) - o.z*sin(radians(angle)), o.y*sin(radians(angle)) + o.z*cos(radians(angle)));
    } else if (axis == 1) {
      return new PVector(o.x*cos(radians(angle)) + o.z*sin(radians(angle)), o.y, -o.x*sin(radians(angle)) + o.z*cos(radians(angle)));
    } else {
      return new PVector(o.x*cos(radians(angle)) - o.y*sin(radians(angle)), o.x*sin(radians(angle))+o.y*cos(radians(angle)));
    }
  }
}

