int x, y;
float dim = 80.0;
PImage bg, marioLeft;
PGraphics pg;
void setup() {
  size(1900,700);
  noStroke();
  bg = loadImage("../../Images/background.jpg");
  //marioLeft = loadImage("../../Images/marioright.png");
  //image(marioLeft, 10, 299);
}
void moveCanvas() {
  pg.loadPixels();
  for (int y=0; y<pg.height; y++) {
    for (int x=0; x<pg.width-1; x++) {
      int index = x + y * pg.width;
      pg.pixels[index] = pg.pixels[index+1];
    }
  }
  pg.updatePixels();
}
void draw() {
  background(bg);
  moveCanvas();
}