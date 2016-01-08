class Mario{
  color c;
  float xcor;
  float ycor;
  Mario() {
    c = color(220,0,0);
    xcor = width/2;
    ycor = height*5/6;
  }
  void display(){
    fill(c);
    rect(xcor-30,ycor-50,30,50);
  }
}