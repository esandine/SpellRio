class Mario{
  color c;//his color
  float xcor;//coordinates of the point that represents him
  float ycor;
  Mario() {//Default Constructor
    c = color(220,0,0);//red
    xcor = width/2;//centered 
    ycor = height*5/6;//on the ground
  }
  void display(){//Displays Mario
    fill(c);//makes a red rectangle that is 30x50
    rect(xcor-30,ycor-50,30,50);
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
}