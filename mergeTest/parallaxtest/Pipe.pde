class Pipe{
    public int x;
    public int y;
    public int mywidth;
    public int myheight;
    public int speed = 3;
    public String orientation;
    private PImage img;
    
    public Pipe(String orientation){
      this.orientation = orientation;
      reset();
    }
    public void reset(){
      mywidth = 66;
      myheight = 400;
      x = width + 2;
    }
    public void update(){
        x -= speed;
    }
    
    public boolean collides(int _x, int _y, int _width, int _height){
      int margin = 2;
      if (_x + _width - margin > x && _x + margin < x + width) {
            if (orientation.equals("south") && _y < y + height) {
                return true;
            } else if (orientation.equals("north") && _y + _height > y) {
                return true;
            }
        }
        return false;
    }
 
}
      
    