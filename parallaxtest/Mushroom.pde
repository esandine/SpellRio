class Mushroom extends Terrain {
  boolean collected;
  String identifier;
  Mushroom(float x, float y, float l, float h, String s) {
    super(x, y, l, h, s);
    collected = false;
    if (s.equals("mushroom.png")) {
      identifier = "redShroom";
    } else if (s.equals("oneUpShroom.png")) {
      identifier = "greenShroom";
    } else if (s.equals("fireFlower.png")) {
      identifier = "iceFlower";
    }
  }
  public void upTrigger(Mario m) {
    incrementHealthNum(m);
  }
  public void downTrigger(Mario m, ArrayList<Terrain> ts) {
    incrementHealthNum(m);
  }
  public void leftTrigger(Mario m) {
    incrementHealthNum(m);
  }
  public void rightTrigger(Mario m) {
    incrementHealthNum(m);
  }
  void display() {
    if (!collected) {
      super.display();
    }
  }
  void incrementHealthNum(Mario m) {
    if (collected == false) {
      if (identifier.equals("redShroom")) {
        m.setHealth(2);
        collected = true;
        //print("redShroomObtained");
        m.setVsize(50);
        m.setHsize(30);
        m.setHasARedPowerUp(true);
      }
      if (identifier.equals("greenShroom")) {
        m.setHealth(m.getHealth()+1);
        collected = true;
        //print("greenShroomObtained");
        m.setHasAGreenPowerUp(true);
        //print(m.getHasAGreenPowerUp());
      }
      if (identifier.equals("iceFlower")) {
        m.setObtainedIceFlower(true);
        collected=true;
        //print("iceflower");
        m.setHealth(2);
        m.setMario("standingFireMario.png");
      }
    }
  }
}