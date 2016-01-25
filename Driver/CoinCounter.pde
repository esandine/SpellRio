class CoinCounter{
  int coinNum = 0;
  PImage collecter, healthCounter;
  
  CoinCounter(){
      coinNum = 0;
      collecter = loadImage("coinCounterImage.png");
      healthCounter = loadImage("healthCounter.png");
  }
  void incrementCoinNum(Mario m){
    coinNum=m.getCoinsCollected();
    //delete the coin
  }
  void display(){
    // show the number of coins collected
    collecter.resize(25,25);
    healthCounter.resize(25,25);
    image(collecter,5,5);
    textSize(20);
    text(""+coinNum,35,30);
    
    image(healthCounter, width - 50, 10);
    textSize(20);
    fill(0,0,0);
    text(""+itsame.getHealth(),width - 20,30);
  }
}
  
          