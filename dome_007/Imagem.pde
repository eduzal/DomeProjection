class Imagem {
  PImage img;
  int r;        //radius
  float theta;  //angulo
  float x, y;    //posição
  float life;    //vida
  float lifeSpeed;    //velocidade
  String id;

  Imagem(PImage _img, int _r, float _theta, String _id) {
    img=_img;
    r=_r;
    theta=_theta;
    id=_id;
    x=r*cos(radians(theta));
    y=r*sin(radians(theta));
    life=255;
    lifeSpeed=.25;
  }

  void update() {
    life-=lifeSpeed;
    //println("life:"+life);
  }

  void display() {
    pushMatrix();
    translate(x, y);
    rotate(radians(theta-90));
    //tint(255,life);
    image(img, 0, 0);
    //text(id,0,0);
    popMatrix();
  }
  
  boolean isDead() {
    if (life<0) {
      return true;
    } else {
      return false;
    }
  }
}
