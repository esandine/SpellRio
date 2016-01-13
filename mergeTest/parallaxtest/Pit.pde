public class Pit extends Terrain{
  private color pitColor;
  public Pit(float x, float y, float l, float h, int c){
      super(x,y,l,h);
      pitColor = c;
  }
  public Pit(color c){
      this(100,100,100,100,c);
  }
  
  public color getColor(){
      return pitColor;
  }
  
  public void setColor(int r, int g, int b){
      pitColor = color(r,g,b);
  }
  
  public void display(){
    setColor(255,204,0);
    rect(200,300,20,40);
    fill(255,204,0);
  }

}