public class Goomba extends Enemy{
   public Goomba(float x,float y,float l,float h,String s){
     super(x,y,l,h,s);
   }
   public Goomba(String s){
     this(150,150,15,15,s);
   }
   public void oneMove(){
     move(-.5,0);
   }
}