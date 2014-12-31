
class Cube {

  // Properties
  color green = color(0, 255, 0);
  color red = color(255, 0, 0);
  color blue = color(0, 0, 255);
  color yellow = color(255, 255, 0);
  color white = color(255, 255, 255);
  color orange = color(255, 162, 0);
  int w, h, d;
  int shiftX, shiftY, shiftZ;

  // Constructor
  Cube(int w, int h, int d, int shiftX, int shiftY, int shiftZ){
    this.w = w;
    this.h = h;
    this.d = d;
    this.shiftX = shiftX;
    this.shiftY = shiftY;
    this.shiftZ = shiftZ;
  }

  // Main cube drawing method, which looks 
  // more confusing than it really is. It's 
  // just a bunch of rectangles drawn for 
  // each cube face
  void drawCube(){
    beginShape(QUADS);
    // Front face
    fill(blue); vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    fill(blue); vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    fill(blue); vertex(w + shiftX, h + shiftY, -d/2 + shiftZ); 
    fill(blue); vertex(-w/2 + shiftX, h + shiftY, -d/2 + shiftZ); 

    // Back face
    fill(green); vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ); 
    fill(green); vertex(w + shiftX, -h/2 + shiftY, d + shiftZ); 
    fill(green); vertex(w + shiftX, h + shiftY, d + shiftZ); 
    fill(green); vertex(-w/2 + shiftX, h + shiftY, d + shiftZ);

    // Left face
    fill(red); vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    fill(red); vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ); 
    fill(red); vertex(-w/2 + shiftX, h + shiftY, d + shiftZ); 
    fill(red); vertex(-w/2 + shiftX, h + shiftY, -d/2 + shiftZ); 

    // Right face
    fill(orange); vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    fill(orange); vertex(w + shiftX, -h/2 + shiftY, d + shiftZ); 
    fill(orange); vertex(w + shiftX, h + shiftY, d + shiftZ); 
    fill(orange); vertex(w + shiftX, h + shiftY, -d/2 + shiftZ); 

    // Top face
    fill(yellow); vertex(-w/2 + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    fill(yellow); vertex(w + shiftX, -h/2 + shiftY, -d/2 + shiftZ); 
    fill(yellow); vertex(w + shiftX, -h/2 + shiftY, d + shiftZ); 
    fill(yellow); vertex(-w/2 + shiftX, -h/2 + shiftY, d + shiftZ); 

    // Bottom face
    fill(white); vertex(-w/2 + shiftX, h + shiftY, -d/2 + shiftZ); 
    fill(white); vertex(w + shiftX, h + shiftY, -d/2 + shiftZ); 
    fill(white); vertex(w + shiftX, h + shiftY, d + shiftZ); 
    fill(white); vertex(-w/2 + shiftX, h + shiftY, d + shiftZ); 

    endShape(); 

    // Add some rotation to each box for pizazz.
    rotateY(radians(1));
    rotateX(radians(1));
    rotateZ(radians(1));
  }
}
