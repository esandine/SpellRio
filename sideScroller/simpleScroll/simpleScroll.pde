float x, y;
float dim = 80.0;

void setup() {
  size(640, 360);
  noStroke();
}

void draw() {
  background(102);
  
  x = x + 0.8;
  
  if (x > width + dim) {
    x = -dim;
  } 
  
  translate(x, height/2-dim);
  fill(255);
  rect(-dim/2, -dim/2, dim, dim);
  
 
}