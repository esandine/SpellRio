PImage coin;
class Coin{
    boolean collected;
    int xcor;
    int ycor;
    Coin(int x, int y){
      xcor = x;
      ycor = y;
      collected = false;
    }
    int getXcor(){
      return xcor;
    }
    int getYcor(){
      return ycor;
    }
    void display(){
      if(!collected){
      coin = loadImage("coin.png");
      //image(coin,xcor,ycor);
      coin.resize(15,15);
      image(coin,xcor,ycor);
      }
    }
    
}
    
      
      
        