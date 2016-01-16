PImage mario;
class Mario{
  color c;//his color
  float xcor;//coordinates of the point that represents him
  float ycor;
  int isjumping;//Keeps track of how long he has been jumping. 0-15 
  int jumpsleft;//Keeps track of the double jump
  float gravity;//ADjusts gravity based on his position
  boolean apressed;//Keeps track of whether a or d are pressed
  boolean dpressed;
  int health; 
  int coinscollected;
  boolean onground;
 
  Mario(color C, float x, float y){
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
    onground=false;
  }
  Mario(float x, float y){
    this(color(220,0,0),x,y);
  }
  Mario(){
    this(width/2,360);
  }
  void display(){//Displays Mario
  if(getHealth() > 0){
    mario=loadImage("standingMario.gif");
    image(mario,getXcor(),getYcor());
  }
  }
  void move(float dx,float dy){//Moves Mario a specified distance
    xcor+=dx;
    if(xcor>width){//the wrap around
      xcor=0;
    }
    if(xcor<0){
      xcor=width;
    }
    ycor-=dy;
    if(ycor<0){
      ycor=height;
    }
    if(ycor>height){
      ycor=0;
    }
  }
  //Accessors
  float getXcor(){
    return xcor;
  }
  float getYcor(){
    return ycor;
  }
  color getC(){
    return c;
  }
  int getJumpsLeft(){
    return jumpsleft;
  }
  int getIsJumping(){
    return isjumping;
  }
  boolean getApressed(){
    return apressed;
  }
  boolean getDpressed(){
    return dpressed;
  }
  int getHealth(){
    return health;
  }
  int getCoinsCollected(){
    return coinscollected;
  }
  boolean getOnGround(){
    return onground;
  }
  //Mutators
  void setXcor(float x){
      xcor = x;
  }
  void setYcor(float y){
      ycor = y;
  }
  void setJumpsLeft(int n){
    jumpsleft = n;
  }
  void setIsJumping(int n){
    isjumping = n;
  }
  void setApressed(boolean tf){
    apressed=tf;
  }
  void setDpressed(boolean tf){
    dpressed=tf;
  }
  void setGravity(int g){
    gravity=g;
  }
  void setHealth(int h){
    health = h;
  }
  void setCoinsCollected(int c){
    coinscollected=c;
  }
  void setOnGround(boolean b){
    onground = b;
  }
  //jump() triggers when up is pressed.
  void jump(){
    setJumpsLeft(getJumpsLeft()-1);
    gravity=0;
  }
  int moveLeftRight(){//Moves Mario left and right
      if(apressed&&dpressed){
        return 0;
      }
     if(apressed){
       return 3;
     }
     if(dpressed){
       return -3;
    }
    else{
      return 0;
    }
  }
  //moveUpDown moves Mario either vertically up, or vertically down
  float moveUpDown(float retValue){
    if(retValue<=-10){//If mario hits the ground
      itsame.setJumpsLeft(2);
      retValue=-10;
    }else{
    gravity += .5;//((groundheight-itsame.getYcor())/38);//Readjusts gravity based on his height
    retValue+=10-gravity;
    }
    return retValue;
  }
  public boolean isInside(Terrain m,float hori,float vert){
    return (getXcor()>m.getXcor()+hori) && (getXcor()<m.getXcor()+m.getLength()+hori) && (getYcor()>m.getYcor()-15-vert) && (getYcor()<m.getYcor()+m.getHeight()-vert);
  }
  public void die(){
    setHealth(0);
    lost = true;
  }
  public void triggers(ArrayList<Terrain> ts,float hori,float vert,float prehori,float prevert){
    for(int i=0;i<ts.size();i++){
      if(isInside(ts.get(i),hori,vert)){
        if(!isInside(ts.get(i),hori,(vert-prevert)+vert)){
          print("down");
        }
        if(!isInside(ts.get(i),hori,(prevert-vert)+vert)){
          print("up");
        }
        if(!isInside(ts.get(i),(hori-prehori)+hori,vert)){
          print("right");
        }
        if(!isInside(ts.get(i),(prehori-hori)+hori,vert)){
          print("left");
        }
      }
    }
  }
}