int angle, initangle;
boolean rotated = true;

void setup() {
  size(200, 200);
  angle = 0;
  initangle = 0;
}

void draw() {
  background(0);
  
  if (angle < 90) {
    angle++;
    println(initangle);
  }else{
    rotated = true;
  }

  // What's unclear to me here is why the translate is necessary.
  // If you could explain it that would be great.
  translate(width/2, height/2);
  rotate(radians(initangle*90));
  rotate(radians(angle));
  translate(-width/2, -height/2);
  ellipse(width/2,height/2, 50, 30);

}

void keyPressed() {

  if(rotated){
    angle = 0;
    initangle++;
  }
  rotated = false;
}

