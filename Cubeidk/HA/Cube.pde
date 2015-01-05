public class Cube{
  color black = color(0, 0, 0);  
  color green = color(0, 255, 0);
  color red = color(255, 0, 0);
  color blue = color(0, 0, 255);
  color yellow = color(255, 255, 0);
  color white = color(255, 255, 255);
  color orange = color(255, 162, 0);
  int sideLength;
  int shiftX, shiftY, shiftZ; 
  
  Cube(int sideLength, int shiftX, int shiftY, int shiftZ){
   this.sideLength = sideLength;
   this.shiftX = shiftX;
   this.shiftY = shiftY;
   this.shiftZ = shiftZ; 
  }
  
  
  void drawCube(){
    beginShape(QUADS);
    fill(black);
    vertex(-sideLength/2 + shiftX, -sideLength/2, -sideLength/2);
  }
}
