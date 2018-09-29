class Bola {
  PVector pos;
  float d, dim;
  float r;
  float dBuffer;
  int h, s, b;

  Bola(PVector _pos, float _dim) {
    pos=_pos;
    dim=_dim*1.5;
    d=_dim;
  }

  void calc(float distance) {
    dBuffer=distance;
    d=map(distance, 10, 2400, 0, dim*2);
    r=map(distance, 10, 2400, -60, 60);
  }

  void display() {
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    noStroke();
    fill(rLG, gLG, bLG);
    switch(mode) {
    case 0:
      ellipse(0, 0, dim-d, dim-d);
      break;
    case 1:
      drawPoly(3);
      break;
    case 2:
      drawPoly(6);
      break;
    case 3:
      star(0, 0, (dim*.65)-d, dim-(d/2), 5);
      break;
    case 4:
      pushMatrix();
      rotate(radians(45));
      rect(0, 0, dim-d, dim-d);
      popMatrix();
      break;
    case 5:
      pushMatrix();
      rotate(radians(r));
      rect(0, dim/2, dim-(d/2), (dim/2)-d);
      popMatrix();
      break;
    }
    popMatrix();
  }

  void drawPoly(int sides) {
    float angle=360/sides;
    pushMatrix();
    translate(-dim/2, -dim/2);
    rotate(radians(r));
    beginShape();
    for (int i = 0; i < sides; i++)
    {
      vertex(dim-d* cos(radians(angle * i)), 
      dim-d * sin(radians(angle * i)));
    }
    endShape(CLOSE);
    popMatrix();
  }

  void star(float x, float y, float radius1, float radius2, int npoints) {
    float angle = 360 / npoints;
    float halfAngle = angle/2.0;
    pushMatrix();
    translate(-dim/2, 0);
    rotate(radians(r));
    beginShape();
    for (float a = 0; a < 360; a += angle) {
      float sx = x + cos(radians(a)) * radius2;
      float sy = y + sin(radians(a)) * radius2;
      vertex(sx, sy);
      sx = x + cos(radians(a+halfAngle)) * radius1;
      sy = y + sin(radians(a+halfAngle)) * radius1;
      vertex(sx, sy);
    }
    endShape(CLOSE);
    popMatrix();
  }
}
