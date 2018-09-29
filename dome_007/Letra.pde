class Letra {
  PFont font;  //fonte
  char c;      //character
  float cw;    //character width
  int ts;      //text size
  int r;        //radius
  float theta;  //angulo
  float x, y;    //posição

  Letra(char _c, PFont _font, int _ts, float _theta, int _r) {
    c=_c;
    ts=_ts;
    font=_font;
    theta=_theta;
    r=_r;
  }
  

  void move(float tInc) {
    theta+=tInc;
    x=r*cos(radians(theta));
    y=r*sin(radians(theta));
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(radians(theta-90));
    fill(255);
    noStroke();
    textFont(font);
    textSize(ts);
    textAlign(CENTER);
    cw = textWidth(c);
    text(c, 0, 0);
    popMatrix();
  }

  boolean isDead() {
    if (theta>350) {
      return true;
    } else {
      return false;
    }
  }
}
