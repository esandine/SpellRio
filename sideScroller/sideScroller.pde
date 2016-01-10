PImage img;
int x,y;
void setup()
  {
    size(800,600);  
    img = loadImage(""); // image is 1600 x 600
  }
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