public class Pipe extends Terrain{
  private PImage img;   
  public Pipe(float x, float y, float l, float h, PImage image){
    super(x,y,l,h);
    img=image;
  }
  public Pipe(PImage image){
    this(100,100,100,100,image);
  }
  public PImage getImage(){
    return img;
  }
  public void setImage(PImage nimg){
    img = nimg;
  }
  public void display(){
  }
}
/*class Pipe{
    public int x;
    public int y;
    public int mywidth;
    public int myheight;
    public int speed = 3;
    public String orientation;
    private PImage img;   
    public Pipe(int x, int y){
      mywidth = x;
      myheight = y;
      img.resize(mywidth, myheight);
    }
    public void reset(){
      mywidth = 66;
      myheight = 400;
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
*/      
    