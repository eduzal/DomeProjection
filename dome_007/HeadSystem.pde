class HeadSystem {
  ArrayList<PVector> localHead;
  ArrayList<Float> angles;
  Head h;
  float oX, oY;
  float x, y;
  float angle=0;
  float prevAngle;
  int amount, previous;

  HeadSystem() {
    oX=width/2;
    oY=height/2;
    x=0;
    y=0;
    localHead=new ArrayList<PVector>();
    angles=new ArrayList<Float>();
    h=heads.get(headDisplay);
  }

  void refreshHead(int show) {
    h=heads.get(show);
    println("displaying head: "+show);
  }

  void refreshAmount(int am, int prev) {
    localHead.clear();
    angles.clear();


    previous=prev;
    amount=am;
    println("localsize:"+localHead.size());
    println("previous:"+previous);
    println("actual:"+amount);
    for (int i=0; i<amount; i++) {
      angle=i*(360/amount); 
      angles.add(angle);
      x=oX+cos(radians(angle))*radius; 
      y=oY+sin(radians(angle))*radius; 
      PVector pos=new PVector(x, y, 0); 
      println("position "+i+ ":"+pos);
      localHead.add(pos);
    }
    println("localsize:"+localHead.size());
  }

  void update() {
    //localHead.clear();

    for (int i=angles.size()-1; i>=0; i--) {
      //PVector p=localHead.get(i);
      prevAngle=angle;
      angle=angles.get(i); 
      angle+=posInc;
      x=oX+cos(radians(angle))*radius;
      y=oY+sin(radians(angle))*radius;
      PVector pos=new PVector(x, y, 0); 
      localHead.set(i, pos);
      angles.set(i, angle);
      h.objScale=headScale;
    }
  }

  void display() {

    Head h=heads.get(headDisplay); 

    for (int i=0; i<localHead.size(); i++) {
      PVector p=localHead.get(i);
      pushMatrix();
      translate(p.x, p.y, p.z);
      h.run();
      popMatrix();
    }
  }
}
