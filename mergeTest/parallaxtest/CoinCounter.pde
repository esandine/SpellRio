class CoinCounter{
  int coinNum = 0;
  CoinCounter(){
      coinNum = 0;
  }
  void incrementCoinNum(Mario m){
    coinNum=m.getCoinsCollected();
    //delete the coin
  }
  void display(){
    // show the number of coins collected
    textSize(20);
    text(("Coins Collected:" + coinNum),10,30);
  }
}
  
          