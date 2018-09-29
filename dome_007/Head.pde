class Head {
  //HEAD
  PShape head;

  //HEAD VARIABLES
  PVector position;
  PVector velocity;
  PVector acceleration;
  PVector rotation;

  float objScale=1;

  Head(PShape h, PVector _origin) {
    head=h;
    position=_origin.copy();
    velocity=new PVector(0, 0, 0);
    acceleration=new PVector(0, 0, 0);
  }
  
  Head(PVector _origin) {
    position=_origin.copy();
    velocity=new PVector(0, 0, 0);
    acceleration=new PVector(0, 0, 0);
  }

  void run() {
    //applyForce(posInc);
    update();
    display();
  }

  void applyForce(float inc) {
    PVector trig=new PVector(inc*cos(inc), inc*sin(inc), 0);
    acceleration.add(trig);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);
    
    rotX+=incRX;
    rotY+=incRY;
    rotZ+=incRZ;
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y, posZ);
    rotateX(radians(rotX));
    rotateY(radians(rotY));
    rotateZ(radians(rotZ));
    scale(objScale);
    shape(head);  
    popMatrix();
  }
}
