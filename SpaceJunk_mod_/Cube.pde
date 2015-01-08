public class Cube{
  color black = color(0, 0, 0);  
  color green = color(0, 255, 0);
  color red = color(255, 0, 0);
  color blue = color(0, 0, 255);
  color yellow = color(255, 255, 0);
  color white = color(255, 255, 255);
  color orange = color(255, 162, 0);
  int sideLength;
  float shiftX, shiftY, shiftZ; 

  Cube(int sideLength, float shiftX, float shiftY, float shiftZ){
   this.sideLength = sideLength;
   this.shiftX = shiftX;
   this.shiftY = shiftY;
   this.shiftZ = shiftZ; 
  }
  
  
  void drawCube(){
    beginShape(QUADS);
    //Back 
    fill(black);
    vertex(-sideLength/2 + shiftX, -sideLength/2 + shiftY, -sideLength/2 + shiftZ);
    vertex(sideLength + shiftX, -sideLength/2 + shiftY, -sideLength/2 + shiftZ);
    vertex(sideLength + shiftX, sideLength + shiftY, -sideLength/2 + shiftZ);
    vertex(-sideLength/2 + shiftX, sideLength + shiftY, -sideLength/2 + shiftZ);
    
    fill(blue);
    vertex(-sideLength/2 + shiftX + (0.1 * sideLength), -sideLength/2 + shiftY + (0.1 * sideLength), -sideLength/2 + shiftZ - .01);
    vertex(sideLength + shiftX - (0.1 * sideLength), -sideLength/2 + shiftY + (0.1 * sideLength), -sideLength/2 + shiftZ - .01);
    vertex(sideLength + shiftX - (0.1 * sideLength), sideLength + shiftY - (0.1 * sideLength), -sideLength/2 + shiftZ - .01);
    vertex(-sideLength/2 + shiftX + (0.1 * sideLength), sideLength + shiftY - (0.1 * sideLength), -sideLength/2 + shiftZ - .01);
    
    //Front 
    fill(black);
    vertex(-sideLength/2 + shiftX, -sideLength/2 + shiftY, sideLength + shiftZ);
    vertex(sideLength + shiftX, -sideLength/2 + shiftY, sideLength + shiftZ);
    vertex(sideLength + shiftX, sideLength + shiftY, sideLength + shiftZ);
    vertex(-sideLength/2 + shiftX, sideLength + shiftY, sideLength + shiftZ);
    
    fill(green);
    vertex(-sideLength/2 + shiftX  + (0.1 * sideLength), -sideLength/2 + shiftY  + (0.1 * sideLength), sideLength + shiftZ + .01);
    vertex(sideLength + shiftX  - (0.1 * sideLength), -sideLength/2 + shiftY  + (0.1 * sideLength), sideLength + shiftZ + .01);
    vertex(sideLength + shiftX  - (0.1 * sideLength), sideLength + shiftY  - (0.1 * sideLength), sideLength + shiftZ + .01);
    vertex(-sideLength/2 + shiftX  + (0.1 * sideLength), sideLength + shiftY  - (0.1 * sideLength), sideLength + shiftZ + .01);
    
    //Left
    fill(black);
    vertex(-sideLength/2 + shiftX, -sideLength/2 + shiftY, -sideLength/2 + shiftZ);
    vertex(-sideLength/2 + shiftX, -sideLength/2 + shiftY, sideLength + shiftZ);
    vertex(-sideLength/2 + shiftX, sideLength + shiftY, sideLength + shiftZ);
    vertex(-sideLength/2 + shiftX, sideLength + shiftY, -sideLength/2 + shiftZ);
    
    fill(orange);
    vertex(-sideLength/2 + shiftX - .01, -sideLength/2 + shiftY + (0.1 * sideLength), -sideLength/2 + shiftZ + (0.1 * sideLength));
    vertex(-sideLength/2 + shiftX - .01, -sideLength/2 + shiftY + (0.1 * sideLength), sideLength + shiftZ - (0.1 * sideLength));
    vertex(-sideLength/2 + shiftX - .01, sideLength + shiftY - (0.1 * sideLength), sideLength + shiftZ - (0.1 * sideLength));
    vertex(-sideLength/2 + shiftX - .01, sideLength + shiftY - (0.1 * sideLength), -sideLength/2 + shiftZ + (0.1 * sideLength));
       
    //Right
    fill(black);
    vertex(sideLength + shiftX, -sideLength/2 + shiftY, -sideLength/2 + shiftZ);
    vertex(sideLength + shiftX, -sideLength/2 + shiftY, sideLength + shiftZ);
    vertex(sideLength + shiftX, sideLength + shiftY, sideLength + shiftZ);
    vertex(sideLength + shiftX, sideLength + shiftY, -sideLength/2 + shiftZ);
    
    fill(red);
    vertex(sideLength + shiftX + .01, -sideLength/2 + shiftY + (0.1 * sideLength), -sideLength/2 + shiftZ + (0.1 * sideLength));
    vertex(sideLength + shiftX + .01, -sideLength/2 + shiftY + (0.1 * sideLength), sideLength + shiftZ - (0.1 * sideLength));
    vertex(sideLength + shiftX + .01, sideLength + shiftY - (0.1 * sideLength), sideLength + shiftZ - (0.1 * sideLength));
    vertex(sideLength + shiftX + .01, sideLength + shiftY - (0.1 * sideLength), -sideLength/2 + shiftZ + (0.1 * sideLength));
    
    //Top
    fill(black);
    vertex(-sideLength/2 + shiftX, -sideLength/2 + shiftY, -sideLength/2 + shiftZ);
    vertex(sideLength + shiftX, -sideLength/2 + shiftY, -sideLength/2 + shiftZ);
    vertex(sideLength + shiftX, -sideLength/2 + shiftY, sideLength + shiftZ);
    vertex(-sideLength/2 + shiftX, -sideLength/2 + shiftY, sideLength + shiftZ);
    
    fill(white);
    vertex(-sideLength/2 + shiftX  + (0.1 * sideLength), -sideLength/2 + shiftY - .01, -sideLength/2 + shiftZ  + (0.1 * sideLength));
    vertex(sideLength + shiftX - (0.1 * sideLength), -sideLength/2 + shiftY - .01, -sideLength/2 + shiftZ  + (0.1 * sideLength));
    vertex(sideLength + shiftX - (0.1 * sideLength), -sideLength/2 + shiftY - .01, sideLength + shiftZ - (0.1 * sideLength));
    vertex(-sideLength/2 + shiftX  + (0.1 * sideLength), -sideLength/2 + shiftY - .01, sideLength + shiftZ - (0.1 * sideLength));
    
    //Bottom
    fill(black);
    vertex(-sideLength/2 + shiftX, sideLength + shiftY, -sideLength/2 + shiftZ);
    vertex(sideLength + shiftX, sideLength + shiftY, -sideLength/2 + shiftZ);
    vertex(sideLength + shiftX, sideLength + shiftY, sideLength + shiftZ);
    vertex(-sideLength/2 + shiftX, sideLength + shiftY, sideLength + shiftZ);
    
    fill(yellow);
    vertex(-sideLength/2 + shiftX + (0.1 * sideLength), sideLength + shiftY + .01, -sideLength/2 + shiftZ + (0.1 * sideLength));
    vertex(sideLength + shiftX - (0.1 * sideLength), sideLength + shiftY + .01, -sideLength/2 + shiftZ + (0.1 * sideLength));
    vertex(sideLength + shiftX - (0.1 * sideLength), sideLength + shiftY + .01, sideLength + shiftZ - (0.1 * sideLength));
    vertex(-sideLength/2 + shiftX + (0.1 * sideLength), sideLength + shiftY + .01, sideLength + shiftZ - (0.1 * sideLength));
    
    endShape();
    
  }
}
