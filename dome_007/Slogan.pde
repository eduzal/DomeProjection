class Slogan {
  ArrayList<Letra> letras;
  String[] txt;
  String tudo;
  int r;
  PFont fonte;
  int angle;
  int charcount;
  int fontSize;
  float thetaSpeed;

  Slogan(String[] _txt, PFont _fonte, int _r, int _fontSize) {
    letras=new ArrayList<Letra>() ;
    txt=_txt;
    tudo=join(txt, "");
    println("tudo lenght: "+tudo.length());
    fonte=_fonte;
    fontSize=_fontSize;
    r=_r;
    fontSize=int(map(r,0,400,4,40));
    charcount=0;
    angle=0;
    thetaSpeed=.1;
  }

  void addLetra() {
    char c=tudo.charAt(charcount);
    println("charcount: "+charcount);
    letras.add(new Letra(c, fonte, fontSize, angle, r));

    if (charcount >= tudo.length()-1) {
      charcount=0;
      
    } else {
      charcount++;
    }
  }

  void update() {
    for (Letra l : letras) {
      l.move(thetaSpeed);
    }
  }

  void display() {
    pushMatrix();
    translate(width/2, height/2);
    for (int i=letras.size()-1; i>=0; i--) {
      Letra l=letras.get(i);
      l.display();
      if (l.isDead()) {
        letras.remove(l);
      }
    }
    popMatrix();
  }
}
