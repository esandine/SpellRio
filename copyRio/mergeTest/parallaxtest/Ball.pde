public class Ball extends Enemy{
  public Ball(float x, float y, float l, float h, String s){
    super(x,y,l,h,s);
  }
  public Ball(Mario m){
    this(itsame.getXcor(),itsame.getYcor(),30,30,"Fireball.png");
  }
  void oneMove(ArrayList<Terrain> t){
    setXcor(getXcor()+3);
  }
}