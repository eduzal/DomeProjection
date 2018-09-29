class ImagemSystem {
  ArrayList<Imagem> imgs;

  ImagemSystem() {
    imgs=new ArrayList<Imagem>();
  }

  void addImagem(PImage img, int radius, float angle, String id) {
    imgs.add(new Imagem(img, radius, angle, id));
  }

  void run() {
    update();
    display();
  }

  void update() {
    for (int i=imgs.size()-1; i>=0; i--) {
      Imagem img=imgs.get(i);

      img.update();
    }
  }

  void display() {
    pushMatrix();
    translate(width/2, height/2);
    for (int i=imgs.size()-1; i>=0; i--) {
      Imagem img=imgs.get(i);
      img.display();
      if (img.isDead()) {
        imgs.remove(i);
      }
    }
    popMatrix();
  }

  void kill() {
    for (int i = imgs.size ()-1; i >= 0; i--) {
      imgs.remove(i);
    }
  }
}
