public class Pit extends Terrain{
  private color pitColor;
  public Pit(float x, float y, float l, float h, color c){
      super(x,y,l,h);
      pitColor = c;
  }
  public Pit(color c){
      super(100,100,100,100,(color(255,204,0)));
  }
  
  public color getColor(){
      return pitColor;
  }
  
  public void setColor(int r, int g, int b){
      pitColor = color(r,g,b);
  }
  
      


}