PImage coin;
class Coin{
    int xcor;
    int ycor;
    Coin(int x, int y){
      xcor = x;
      ycor = y;
    }
    int getXcor(){
      return xcor;
    }
    int getYcor(){
      return ycor;
    }
    void display(){
      coin = loadImage("coin.png");
      //image(coin,xcor,ycor);
      coin.resize(15,15);
      image(coin,xcor,ycor);
    }
    
}
    
      
      
        