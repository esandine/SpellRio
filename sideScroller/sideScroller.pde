<<<<<<< HEAD
final int gridSize = 50; // final is a permanent value 
int halfScreen;
int[] scenery = new int[200];
 
int currentPosition;
int scrollPosition = gridSize;
float x,y;
float dim = 80.0;
PImage bg;
void setup()
{
  size(960,540); // creates dimesions
  bg = loadImage("marioBackground.jpg");
  for (int i = 0; i < scenery.length; i++){
    if (random(1) > 0.85){
      scenery[i] = int(random(height / gridSize));
    }
  }
  // Half screen in terms of grid size
  halfScreen = currentPosition = width / gridSize / 2;
}
 
void draw() // static void main-ish 
{
  x = x = 0.8;
  if(x > width + dim){
      x = -dim;
  }
  translate(x, height/2-dim/2);
  fill(255);
  rect(-dim/2, -dim/2, dim, dim);
  translate(x, dim);
  fill(0);
  rect(-dim/2, -dim/2, dim, dim);
  
  
  
  background(bg);
  fill(#005588);
  for (int i = currentPosition - halfScreen, j = 0; i < currentPosition + halfScreen; i++, j++)
=======
PImage img;
int x,y;
void setup()
>>>>>>> ac271878848a9f15104d4c54e737a0f4dab13907
  {
    size(800,600);  
    img = loadImage(""); // image is 1600 x 600
  }
<<<<<<< HEAD
}
=======
void draw()
{
  //  background(0); 
      // not needed as image is bigger than size 
     // and thus overwrites all areas
  x = constrain(x, 0, img.width - width);    
     // ensures that "scrolling" stops at right end of image
  // y = constrain(y, 0, img.height - height); 
     // Not needed here, as scolling only in x
  image(img, -x, 0);  
     // overwrites the whole screen with the "shifted" image
  x = frameCount;     
     // advances the image with each new frame
     // do whatever is wanted from here on 
     // like after a call of background();
  stroke(0,0,0);
  ellipse(mouseX,mouseY,15,15);
}
>>>>>>> ac271878848a9f15104d4c54e737a0f4dab13907
