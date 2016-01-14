class CoinCounter{
  int coinNum = 0;
  CoinCounter(){
      coinNum = 0;
  }
  
  void incrementCoinNum(int x,Mario actor, Coin money){
    if(isCollected(actor,money)){
    coinNum += x;
    }
  }
  
  boolean isCollected(Mario m, Coin c){
      return ((m.getXcor() == c.getXcor()) && (m.getYcor() == c.getYcor()));
  }
  
  void display(){
    // show the number of coins collected
    textSize(20);
    text(("Coins Collected:" + coinNum),10,30);
  }
}
  
          