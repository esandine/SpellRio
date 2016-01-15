class CoinCounter{
  int coinNum = 0;
  CoinCounter(){
      coinNum = 0;
  }
  void incrementCoinNum(Mario m){
    coinNum=m.getCoinsCollected();
    //delete the coin
  }
  
  boolean isCollected(Mario m, Coin c){
      return (((m.getXcor() > c.getXcor() -1)&&(m.getXcor() < c.getXcor() + 1))||
      ((m.getYcor() > c.getYcor() -1)&&(m.getYcor() < c.getYcor() + 1)));
  }
  
  void display(){
    // show the number of coins collected
    textSize(20);
    text(("Coins Collected:" + coinNum),10,30);
  }
}
  
          