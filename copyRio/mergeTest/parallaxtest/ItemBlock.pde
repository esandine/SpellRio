public class ItemBlock extends Terrain implements Collectable {
  public boolean collected;
  String identifier;
  public ItemBlock(float x, float y, float l, float h, String s) {
    super(x, y, l, h, s);
    collected = false;
    identifier = s;
  }
  public ItemBlock(String s) {
    this(100, 100, 100, 100, s);
  }
  public void upTrigger(Mario m) {
    while (m.isInsideVerticle(this)) {
      m.move(0, .1);
    }
    m.setJumpsLeft(2);
    if (itsame.getObtainedIceFlower()) {
      itsame.setMario("standingFireMario.png");
    } else {
      itsame.setMario("standingMario.png");
    }
  }
  public void leftTrigger(Mario m) {
    m.setHorizontal(m.getOldHorizontal());
  }
  public void rightTrigger(Mario m) {
    m.setHorizontal(m.getOldHorizontal());
  }
  public void downTrigger(Mario m, ArrayList<Terrain> ts) {
    double number = random(10);
    while (m.isInsideVerticle(this)) {
      m.move(0, -.1);
    }
    if (identifier=="itemblock.png") {
      ts.add(new Coin(getXcor(), getYcor(), 15, 15, "coin.png"));
      print("coin obtained");
    } else if (number<3) {
      ts.add(new Mushroom(getXcor(), getYcor(), 15, 15, "fireFlower.png"));
      setCollected(true);
    } else if (number<6) {
      ts.add(new Mushroom(getXcor(), getYcor(), 15, 15, "mushroom.png"));
      setCollected(true);
    } else {
      ts.add(new Mushroom(getXcor(), getYcor(), 15, 15, "oneUpShroom.png"));
    }
    ts.remove(this);
  }
  public void setCollected(boolean b) {
    collected=b;
  }
  public boolean getCollected() {
    return collected;
  }
}