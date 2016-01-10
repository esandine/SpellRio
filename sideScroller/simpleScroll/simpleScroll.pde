float x, y;
float dim = 80.0;
PImage bg, marioLeft;
void setup() {
  size(600, 385);
  noStroke();
  bg = loadImage("../../Images/marioBG.png");
  marioLeft = loadImage("../../Images/marioright.png");
  image(marioLeft, 10, 299);
}

void draw() {
  background(bg);
  
  x = x + 0.8;

  if (x > width + dim) {
    x = -dim;
  } 
  // 100 , 760;

  translate(x, 218);
  fill(22);
  image(marioLeft, dim, dim);
}