class Mario {
  PImage mario;
  color c;//his color
  float xcor;//coordinates of the point that represents him
  float ycor;
  int isjumping;//Keeps track of how long he has been jumping. 0-15 
  int jumpsleft;//Keeps track of the double jump
  float gravity;//ADjusts gravity based on his position
  boolean apressed;//Keeps track of whether a or d are pressed
  boolean dpressed;
  int health; 
  boolean won;
  int coinscollected;
  boolean onground;
  float horizontal;
  float oldHorizontal;
  //float groundsurface;

  // POWER-UPS BOOLEANS:
  boolean hasAGreenPowerUp;
  boolean obtainedIceFlower;
  boolean hasShell;
  boolean loaded;
  float vsize;
  float hsize;


  Mario(color C, float x, float y) {
    c=C;
    xcor=x;
    ycor=y;
    isjumping=0;
    jumpsleft=2;
    gravity=10;
    apressed=false;
    dpressed=false;
    health = 1;
    coinscollected=0;
    horizontal=0;
    oldHorizontal=0;
    lost = false;
    won = false;
    hasAGreenPowerUp = false;
    obtainedIceFlower = false;
    hasShell=false;
    //groundsurface=-10;
    vsize = 30;
    hsize = 15;
  }
  Mario(float x, float y) {
    this(color(220, 0, 0), x, y);
  }
  Mario() {
    this(width/2, 360);
  }
  void display() {//Displays Mario
    if (getHealth() > 0) {
      if (obtainedIceFlower) {
        //mario = loadImage("iceSuitMario.png");
        //setLoaded(true);
        //print(getObtainedIceFlower());
      } else {
        mario=loadImage("standingMario.gif");
      }
      image(mario, getXcor(), getYcor(),hsize,vsize);
    }
  }
  void move(float dx, float dy) {//Moves Mario a specified distance
    xcor+=dx;
    if (xcor>width) {//the wrap around
      xcor=0;
    }
    if (xcor<0) {
      xcor=width;
    }
    ycor-=dy;
    if (ycor<0) {
      ycor=height;
    }
    if (ycor>height) {
      ycor=0;
    }
  }
  //Accessors
  boolean getLoaded(){
    return loaded;
  }
  float getXcor() {
    return xcor;
  }
  float getYcor() {
    return ycor;
  }
  color getC() {
    return c;
  }
  int getJumpsLeft() {
    return jumpsleft;
  }
  int getIsJumping() {
    return isjumping;
  }
  boolean getApressed() {
    return apressed;
  }
  boolean getDpressed() {
    return dpressed;
  }
  int getHealth() {
    return health;
  }
  int getCoinsCollected() {
    return coinscollected;
  }
  float getOldHorizontal() {
    return oldHorizontal;
  }
  float getHorizontal() {
    return horizontal;
  }
  boolean getLost() {
    return lost;
  }
  boolean getHasAGreenPowerUp() {
    return hasAGreenPowerUp;
  }
  boolean getObtainedIceFlower() {
    return obtainedIceFlower;
  }
  //float getGroundSurface(){
  //  return groundsurface;
  //}
  boolean getHasShell(){
    return hasShell;
  }
  boolean getWon() {
    return won;
  }
  float getVsize(){
    return vsize;
  }
  float getHsize(){
    return hsize;
  }
  void setMario(String s){
    mario = loadImage(s);
  }
  //Mutators
  void setLoaded(boolean b){
    loaded = b;
  }
  void setXcor(float x) {
    xcor = x;
  }
  void setYcor(float y) {
    ycor = y;
  }
  void setJumpsLeft(int n) {
    jumpsleft = n;
  }
  void setIsJumping(int n) {
    isjumping = n;
  }
  void setApressed(boolean tf) {
    apressed=tf;
  }
  void setDpressed(boolean tf) {
    dpressed=tf;
  }
  void setGravity(int g) {
    gravity=g;
  }
  void setHealth(int h) {
    health = h;
  }
  void setCoinsCollected(int c) {
    coinscollected=c;
  }
  //jump() triggers when up is pressed.
  void setHorizontal(float n) {
    horizontal=n;
  }

  void setOldHorizontal(float n) {
    oldHorizontal=n;
  }
  void setWon(boolean b) {
    won=b;
  }
  void setHasAGreenPowerUp(boolean b) {
    hasAGreenPowerUp = b;
  }
  void setObtainedIceFlower(boolean b) {
    obtainedIceFlower = b;
  }
  void setHasShell(boolean b){
    hasShell=b;
  }
  void setVsize(float n){
    vsize = n;
  }
  void setHsize(float n){
    hsize = n;
  }
  //void setGroundSurface(float n){
  //  groundsurface=n;
  //}
  void moveLeftRight(ArrayList<ArrayList<Terrain>> ts) {//Moves Mario left and right
    if (apressed&&dpressed) {
      addHorizontal(0);
    }
    if (apressed) {
      addHorizontal(3);
      for (int i = 0; i<ts.size(); i++) {
        for (int ii=0; ii<ts.get(i).size(); ii++) {
          if (isInside((ts.get(i).get(ii)), getHorizontal(), getYcor())) {
            ts.get(i).get(ii).rightTrigger(this);
            //println("right");
          }
        }
      }
    }
    if (dpressed) {
      addHorizontal(-3);
      for (int i = 0; i<ts.size(); i++) {
        for (int ii=0; ii<ts.get(i).size(); ii++) {
          if (isInside(ts.get(i).get(ii), getHorizontal(), getYcor())) {
            ts.get(i).get(ii).leftTrigger(this);
            //println("left");
          }
        }
      }
    }
    if (getHorizontal()>0) {
      setHorizontal(0);
    } else {
      addHorizontal(0);
    }
  }
  //moveUpDown moves Mario either vertically up, or vertically down
  void moveUpDown(float groundheight, ArrayList<ArrayList<Terrain>> ts) {
    if (gravity<50) {
      gravity += .5;//((groundheight-itsame.getYcor())/38);//Readjusts gravity based on his height
    }
    itsame.move(0, 10-gravity);
    for (int i = 0; i<ts.size(); i++) {
      for (int ii = 0; ii<ts.get(i).size(); ii++) {
        if (isInside(ts.get(i).get(ii), horizontal, 0)) {
          if (10-gravity>0) {
            ts.get(i).get(ii).downTrigger(this, ts.get(i));
          } else {
            ts.get(i).get(ii).upTrigger(this);
          }
        }
      }
    }
    if (itsame.getYcor()>groundheight) {//If mario hits the ground
      itsame.move(0, itsame.getYcor()-groundheight);
      itsame.setJumpsLeft(2);
      gravity-=.5;
    }
  }
  public boolean isInside(Terrain m, float hori, float vert) {
    return isInsideHorizontal(m)&&isInsideVerticle(m);
  }
  public boolean isInsideHorizontal(Terrain m) {
    return (getXcor()>m.getXcor()+getHorizontal())&&(getXcor()<m.getXcor()+m.getLength()+getHorizontal());
  }
  public boolean isInsideVerticle(Terrain m) {
    return (getYcor()>m.getYcor()-15) && (getYcor()<m.getYcor()+m.getHeight());
  }
  public void die() {
    setHealth(0);
    lost = true;
  }
  public void addHorizontal(float n) {
    setHorizontal(getHorizontal()+n);
  }
  boolean checkPipes(ArrayList<Terrain> ts) {
    for (int i = 0; i<5; i++) {
      if (isInsideHorizontal(ts.get(i))) {
        return true;
      }
    }
    return false;
  }
}