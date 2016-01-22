public class Bullet extends Enemy{
   public Bullet(float x,float y,float l,float h,String s){
     super(x,y,l,h,s);
   }
   public Bullet(String s){
     this(150,150,15,15,s);
   }
   public void oneMove(ArrayList<Terrain> t){
     move(-3,0);
   }
}