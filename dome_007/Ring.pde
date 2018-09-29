class Ring {
  PVector origin;
  float dim=0;
  float dimMax=400;
  float life=0;
  float alpha;

  Ring(PVector _origin) {
    origin=_origin.copy();
  }

  void update() {
    life++;
    //origin.y++;
    //dim=cos(radians(life))*life;
    dim=life;
    alpha=map(life, height*2, 0, 0, 255);
  }

  void display() {
    pushMatrix();
    stroke(ringRed, ringGreen, ringBlue, alpha);
    strokeWeight(ringThick);
    noFill();
    translate(origin.x, origin.y, origin.z);
    //rotateX(radians(90));
    ellipse(0, 0, dim, dim);
    popMatrix();
  }

  boolean isDead() {
    if (life>height*2) {
      return true;
    } else {
      return false;
    }
  }
}
