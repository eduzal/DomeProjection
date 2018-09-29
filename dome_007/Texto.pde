class Texto {
  ArrayList<Linha> linhas;
  String[] txt;
  PFont fonte;
  int textLength;
  int amount;
  int c;
  int counter=0;
  int x, y;
  float r;
  float theta;

  Texto(String[] _txt, PFont _fonte, float _r, float _theta) {
    linhas=new ArrayList<Linha>();
    txt=_txt;
    textLength=txt.length;
    fonte=_fonte;
    r=_r;
    theta=_theta;
    counter=0;
    amount=30;
  }

  void addLinha() {
    linhas.add(new Linha(txt[counter], fonte, 10, amount, r, theta));
  }

  void update() {
    for (int i=0; i<linhas.size(); i++) {
      if (i<amount) {
        Linha l=linhas.get(i);
        l.move(i);
      } else {
        linhas.remove(i-amount);
      }
    }

    if (counter>=textLength-1) {
      counter=0;
    } else {
      counter++;
    }
  }


  void display() {
    pushMatrix();
    translate(width/2,height/2);
    
    for (int i=0; i<linhas.size (); i++) {
      Linha l=linhas.get(i);
      if (i<amount) {
        l.display();
      }
    }
    
    popMatrix();
  }
}
