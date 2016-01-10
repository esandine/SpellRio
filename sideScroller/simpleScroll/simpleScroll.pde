float x, y;
float dim = 80.0;
PImage bg,marioLeft;
void setup() {
  size(600, 385);
  noStroke();
  bg = loadImage("../../Images/marioBG.png");
  marioLeft = loadImage("../../Images/marioright.png");
}

void draw() {
  background(bg);
  image(marioLeft,10,299);
  x = x + 0.8;

  if (x > width + dim) {
    x = -dim;
  } 
// 100 , 760;

  translate(x, height/2-dim);
  fill(22);
  rect(-dim/2, -dim/2, dim, dim);
}