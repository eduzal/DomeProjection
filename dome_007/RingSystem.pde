class RingSystem {
  ArrayList<Ring> rings;
  PVector origin;

  RingSystem(PVector _origin) {
    rings=new ArrayList<Ring>();
    origin=_origin.copy();
  }

  void addRing() {
    rings.add(new Ring(origin));
  }

  void display() {

      for (int i=rings.size()-1; i>0; i--) {
        Ring r=rings.get(i);
        r.update();
        r.display();
        if (r.isDead()) {
          rings.remove(i);
        }
      }
    
  }

  boolean cleared() {
    if (rings.size()==0) {
      return true;
    } else {
      return false;
    }
  }
}
