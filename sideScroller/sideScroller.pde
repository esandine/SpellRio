final int gridSize = 50; // final is a permanent value 
int halfScreen;
int[] scenery = new int[200];
 
int currentPosition;
int scrollPosition = gridSize;
 
void setup()
{
  size(500,500); // creates dimesions
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
  background(255, 204, 0);
  fill(#005588);
  for (int i = currentPosition - halfScreen, j = 0; i < currentPosition + halfScreen; i++, j++)
  {
    if (scenery[i] > 0)
    {
      rect(scrollPosition + j * gridSize, height - scenery[i] * gridSize, 
          gridSize, height);
    }
  }
  fill(255,0,0);
  rect(30, 20, 55, 55, 3, 6, 12, 18); // Character!
 
  scrollPosition = scrollPosition - 1;
  if (scrollPosition == 0)
  {
    currentPosition++;
    scrollPosition = gridSize;
    if (currentPosition == scenery.length - halfScreen)
      exit(); // End
  }
}