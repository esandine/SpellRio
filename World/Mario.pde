class Mario{
  color c;//his color
  float xcor;//coordinates of the point that represents him
  float ycor;
  Mario(color C, float x, float y){
    c=C;
    xcor=x;
    ycor=y;
  }
  Mario(float x, float y){
    this(color(220,0,0),x,y);
  }
  Mario(){
    this(0,0);
  }
  /*
  Mario() {//Default Constructor
    c = color(220,0,0);//red
    xcor = width/2;//centered 
    ycor = height*5/6;//on the ground
  }
  */
  void display(){//Displays Mario
    fill(c);//makes a red rectangle that is 30x50
    rect(xcor,ycor,30,50);
  }
  void move(float dx,float dy){//Moves Mario a specified distance
    xcor+=dx;
    if(xcor>width){//the wrap around
      xcor=0;
    }
    ycor-=dy;
    if(ycor<0){
      ycor=height;
    }
  }
  int getXcor(){
    return xcor;
  }
  int getYcor(){
    return ycor;
  }
  color getC(){
    return C;
  }
}