class Linha {

  String t;
  PFont f;
  int co;
  int s;
  int posY;
  int am;
  float theta;  //angulo
  float x, y;    //posição
  float r;

  Linha(String _t, PFont _f, int _s, int _am, float _r, float _theta) {
    t=_t;
    f=_f;
    s=_s;
    r=_r;
    am=_am;
    theta=_theta;
    x=r*cos(radians(theta));
    y=r*sin(radians(theta));
  }

  void move(int c) {

    y=c%am;
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(radians(theta-90));
    noStroke();
    textFont(f);
    textSize(s);
    fill(255);
    textAlign(LEFT);
    text(t, 10, y*10, 400, s*2.5);
    popMatrix();
  }
}
