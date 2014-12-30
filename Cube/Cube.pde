private static int[][] colors = new int[6][9];
private static int[] cubelets = new int[26];

void setup(){
  size(200,200,P3D);
  background(0);
}

void draw(){
  // placeholder for cube
  pushMatrix();
  translate(40,40,0);
  rotateY(5);
  rotateX(10);
  box(40);
  popMatrix();
}

void LTurn(int dir){
  // This will contain instructions on changing the elements
  // in colors and cubelets, depending on dir
  // dir will be 1 for L, and dir will be -1 for L'
  // This function will also have to graphically animate
  // an L turn.
}
