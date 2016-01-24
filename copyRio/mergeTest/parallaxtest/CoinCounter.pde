class CoinCounter{
  int coinNum = 0;
  PImage collecter;
  
  CoinCounter(){
      coinNum = 0;
      collecter = loadImage("coinCounterImage.png");
  }
  void incrementCoinNum(Mario m){
    coinNum=m.getCoinsCollected();
    //delete the coin
  }
  void display(){
    // show the number of coins collected
    collecter.resize(25,25);
    image(collecter,5,5);
    textSize(20);
    text(""+coinNum,35,30);
  }
}
  
          