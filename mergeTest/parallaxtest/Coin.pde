class Coin{
    PImage coin = loadImage("coin.gif");
    int xcor;
    int ycor;
    Coin(int x, int y){
      xcor = x;
      ycor = y;
      image(coin,xcor,ycor);
    }
    int getXcor(){
      return xcor;
    }
    int getYcor(){
      return ycor;
    }
    
}
    
      
      
        