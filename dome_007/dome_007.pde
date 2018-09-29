//import java.awt.*;
//import java.awt.event.*;
import java.nio.IntBuffer;
import controlP5.*;
import codeanticode.syphon.*;


ControlFrame cf;
SyphonServer syphon;

//DOME SHADERS
PShader cubemapShader;
PShape domeSphere;
IntBuffer fbo;
IntBuffer rbo;
IntBuffer envMapTextureID;
int envMapSize = 1024;  


//Head
ArrayList<Head> heads;
HeadSystem head;
String[] estatuas={"socrates", "torso_redux", "pieta_2", "rameses_redux_3", "alexander_redux_4", "Auguste", "pericles","miniUFO"};
int numEstatuas=estatuas.length;
int headDisplay=0;
int headAmount=1;
int prevHeadAmount=0;
float posInc=0;
float headScale=1.0;
int radius=0;
boolean isHead=false;

float rotX=0;
float rotY=0;
float rotZ=0;
float incRX=0;
float incRY=0;
float incRZ=0;
float posZ=0;

//RING
RingSystem r;
boolean isRing=false;
PVector cPos;
int ringSpeed=30;
int ringRed=255;
int ringGreen=255;
int ringBlue=255;
int ringThick=4;

//GRADIENT BG
boolean isGradient=true;
PGraphics bgGraph;
color[] bgGraphColors= {
  #7229f9, #fc5129, #36dcdd, #ebebeb, #2948fc, #53ffdf, #f654c5
};

//TEXTO CORRIDO
ArrayList<Texto> textos;
String[] textosTitulo={"CLT", "zeninguem", "allsystems"};
String textFile=".txt";
boolean isTextoCorrido=false;
int textoCorridoSpeed=15;
int textoCorridoSize=0;
PFont fonteTC;


//TEXTO 2
ArrayList<Slogan> slogans;
String[] slogansTitulos={"05", "06", "35", "beyondYourDeath", "cowDung", "gibson", "lostPoem", "poemInBlue", "theFallen", "yesterdaysImages"};
boolean isSlogan=false;
int sloganSpeed=20;
int sloganSize=0;
PFont fonteS;

//IMAGENS
ImagemSystem[] is;
color[] pallete= {
  #ff0000, #ff7f00, #ffff00, #00ff00, #00cfff, #005cff, #7c00ff, #ff00b1, #ffffff, #000000
};
StringList imgInventory;
int imageRadius=400;

boolean isArvoresSecas=false;
int arvoresSecasSpeed=90;
String[] arvoresSecas = {
  "arvores_secas01", "arvores_secas02", "arvores_secas03", "arvores_secas04", "arvores_secas05", "arvores_secas06", "arvores_secas07"
};
boolean isCactus=false;
int cactusSpeed=90;
String[] cactus = {
  "cactus01", "cactus02", "cactus03", "cactus04", "cactus05", "cactus06", "cactus07"
};
boolean isFolhagens01=false;
int folhagens01Speed=90;
String[] folhagens01 = {
  "folhagens01", "folhagens02", "folhagens03", "folhagens04", "folhagens05", "folhagens06", "folhagens07", "folhagens08", "folhagens09", "folhagens10"
};
boolean isFolhagens02=false;
int folhagens02Speed=90;
String[] folhagens02 = {
  "folhagens11", "folhagens12", "folhagens13", "folhagens14", "folhagens15", "folhagens16", "folhagens17", "folhagens18", "folhagens19", "folhagens20"
};

boolean isShatter=false;
int shatterSpeed=30;
String[] shatter = {
  "shatter01", "shatter02", "shatter03", "shatter04", "shatter05", "shatter06", "shatter07", "shatter08"
};

boolean isEstatua01=false;
int estatua01Speed=30;
String[] estatua01 = {
  "estatua01", "estatua02", "estatua03", "estatua04", "estatua05", "estatua06", "estatua07", "estatua08", "estatua09", "estatua10", 
  "estatua11", "estatua12", "estatua13", "estatua14", "estatua15", "estatua16"
};

boolean isEstatua02=false;
int estatua02Speed=30;
String[] estatua02 = {
  "estatua17", "estatua18", "estatua19", "estatua20", "estatua21", "estatua22", "estatua23", "estatua24", "estatua25", "estatua26", 
  "estatua27", "estatua28", "estatua29", "estatua30", "estatua31", "estatua32"
};

boolean isDinheiro=false;
int dinheiroSpeed=30;
String[] dinheiro = {
  "din10", "din20", "din50", "din100"
};

boolean isAlphabet=false;
int alphabetSpeed=30;
String[] alphabet = {
  "alphabet01", "alphabet02", "alphabet03", "alphabet04", "alphabet05", "alphabet06", "alphabet07", "alphabet08", "alphabet09", "alphabet10", 
  "alphabet11", "alphabet12", "alphabet13", "alphabet14", "alphabet15", "alphabet16", "alphabet17"
};

boolean isAlien=false;
int alienSpeed=30;
String[] alien = {
  "alien01", "alien02", "alien03", "alien04", "alien05", "alien06", "alien07", "alien08", "alien09", "alien10", 
  "alien11", "alien12", "alien13", "alien14", "alien15"
};

//GRID
ArrayList<Bola> grid;
boolean isGrid;
float gridSize=30;
int mode=0;
int rLG=255;
int gLG=255;
int bLG=255;        
float tx=random(100);
float ty=random(100);

void settings() {
  size(1024, 1024, P3D);
  smooth();
}

void setup() {
  // hint(ENABLE_DEPTH_SORT);
  imageMode(CENTER);

  //Heads setup
  println("loading OBJ Heads");
  heads=new ArrayList<Head>();
  for (int i=0; i<numEstatuas; i++) {
    PShape s=loadShape(estatuas[i]+".obj"); 
    PVector spawn=new PVector(0, 0, 0);
    heads.add(new Head(s, spawn));
  }
  println("OBJ Heads Done");

  //Estatuas Setup
  println("system Setting");
  head=new HeadSystem();
  println("system Done");

  //Syphon
  syphon=new SyphonServer(this, "DOME");

  //gradient setup
  initBackground();

  //GRID SETUP
  grid=new ArrayList<Bola>();
  initGrid();

  //RING SETUP
  cPos=new PVector(width/2, height/2, 0);
  r=new RingSystem(cPos);

  //TEXTOCORRIDO SETUP
  textos=new ArrayList<Texto>();
  fonteTC=createFont("Arial", 8);
  println("TEXTO CORRIDO SIZE: "+textos.size());

  //SLOGAN SETUP
  slogans=new ArrayList<Slogan>();
  fonteS=createFont("HiraginoSans-W6", 40);
  println("SLOGAN CORRIDO SIZE: "+textos.size());

  //IMG SETUP
  //is=new ArrayList<ImagemSystem>();
  imgInventory=new StringList();
  imgInventory.append("arvoresSecas");
  imgInventory.append("cactus");
  imgInventory.append("folhagens01");
  imgInventory.append("folhagens02");
  imgInventory.append("shatter");
  imgInventory.append("estatua01");
  imgInventory.append("estatua02");
  imgInventory.append("dinheiro");
  imgInventory.append("alphabet");
  imgInventory.append("alien");
  is=new ImagemSystem[imgInventory.size()];
  for (int i=0; i<is.length; i++) {
    is[i]=new ImagemSystem();
  }

  //DOME SETUP
  println("Dome Distortion Setting");
  initCubeMap();
  println("Dome DistortionDone");


  //CONTROLP5
  cf =new ControlFrame(this, 400, displayHeight, "MENU", width, height);
  println("ControlFrame Done");
}

void draw() {
  background(32);

  if (isTextoCorrido) {
    for (int i=textos.size()-1; i>=0; i--) {
      if (frameCount%textoCorridoSpeed==0) {
        Texto t=textos.get(i);
        t.addLinha();
      }
    }
  }

  if (isSlogan) {
    for (int i=slogans.size()-1; i>=0; i--) {
      Slogan s=slogans.get(i);

      if (frameCount%sloganSpeed==0) {
        s.addLetra();
        println("ADD LETRA");
      }
    }
  }

  if (isArvoresSecas) {
    if (frameCount % arvoresSecasSpeed==0) {
      newImg(arvoresSecas, 0);
    }
  }

  if (isCactus) {
    if (frameCount % cactusSpeed==0) {
      newImg(cactus, 1);
    }
  }
  if (isFolhagens01) {
    if (frameCount % folhagens01Speed==0) {
      newImg(folhagens01, 2);
    }
  }
  if (isFolhagens02) {
    if (frameCount % folhagens02Speed==0) {
      newImg(folhagens02, 3);
    }
  }

  if (isShatter) {
    if (frameCount % shatterSpeed==0) {
      newImg(shatter, 4);
    }
  }
  if (isEstatua01) {
    if (frameCount % estatua01Speed==0) {
      newImg(estatua01, 5);
    }
  }
  if (isEstatua02) {
    if (frameCount % estatua02Speed==0) {
      newImg(estatua02, 6);
    }
  }
  if (isDinheiro) {
    if (frameCount % dinheiroSpeed==0) {
      newImg(dinheiro, 7);
    }
  }

  if (isAlphabet) {
    if (frameCount % alphabetSpeed==0) {
      newImg(alphabet, 8);
    }
  }

  if (isAlien) {
    if (frameCount % alienSpeed==0) {
      newImg(alien, 9);
    }
  }
  drawCubeMap();
  syphon.sendScreen();
}

void clearHeads(int am, int prev) {
  head.refreshAmount(am, prev);
}

void textoCorridoSpawn(int actual, int prev) {
  println("texto Corrido a:"+actual+" p: "+prev);
  if (actual<prev) {
    println("REMOVE TEXT");
    Texto t=textos.get(textos.size()-1);
    textos.remove(t);
  } else if (actual>prev) {
    println("ADD TEXT");
    int textIndex=int(random(textosTitulo.length));
    String[] actualTexto=loadStrings("text01/"+textosTitulo[textIndex]+textFile);
    float r=random(200);
    float theta=actual*(360/5);
    println("TEXTOS: r:"+r);
    println("TEXTOS: "+actualTexto);
    textos.add(new Texto(actualTexto, fonteTC, r, theta));
  }
}

void sloganSpawn(int actual, int prev) {
  println("Slogan a:"+actual+" p: "+prev);
  if (actual<prev) {
    println("REMOVE SLOGAN");
    Slogan s=slogans.get(slogans.size()-1);
    slogans.remove(s);
  } else if (actual>prev) {
    println("ADD SLOGAN");
    int sloganIndex=int(random(slogansTitulos.length));
    String[] actualSlogan=loadStrings("text02/"+slogansTitulos[sloganIndex]+textFile);
    int r=int(random(400));
    println("Slogans: r:"+r);
    println("slogans: "+actualSlogan);
    slogans.add(new Slogan(actualSlogan, fonteS, r, 40));
  }
}

void newImg(String[] set, int itemIndex) {
  PImage img;
  int imgIndex=int(random(set.length));
  String imgURL="imgs/"+set[imgIndex]+".png";
  img=loadImage(imgURL);
  imgSetup(img, itemIndex);
}

void imgSetup(PImage img, int itemIndex) {
  int cIndex=int(random(pallete.length));
  color targetColor;
  PImage s=createImage(img.width, img.height, ARGB);

  img.loadPixels();
  s.loadPixels();
  for (int loc=0; loc<img.pixels.length; loc++) {
    color c = img.pixels[loc];
    float a=alpha(c);
    targetColor=color(red(pallete[cIndex]), green(pallete[cIndex]), blue(pallete[cIndex]), a);
    //targetColor=color(red(255), green(255), blue(255), a);
    if (a>1) {
      s.pixels[loc]=targetColor;
    }
  }
  img.updatePixels();
  s.updatePixels();

  float theta=random(359);
  String item=imgInventory.get(itemIndex);
  is[itemIndex].addImagem(s, imageRadius, theta, item);
  //println(itemIndex);
}

void clearTextoCorrido() {
  for (Texto t : textos) {
    t.counter=0;
  }
  textos.clear();
}

void clearSlogan() {
  slogans.clear();
}

void initGrid() {
  for (int i=-int(width*.125); i<=width*1.25; i+=gridSize) {
    for (int j=-int(height*.125); j<=height*1.25; j+=gridSize) {
      PVector loc=new PVector(i, j, 0);
      grid.add(new Bola(loc, gridSize));
    }
  }
}

void drawGrid() {
  float distance;

  PVector pos=new PVector(map(noise(tx), 0, 1, -width, width*2), map(noise(ty), 0, 1, -height, height*2));

  for (Bola b : grid) {
    distance=PVector.dist(pos, b.pos);
    b.calc(distance);
    b.display();
  }

  tx+=.005;
  ty+=.005;
}


void drawScene() {
  background(0);

  if (isGradient) {
    image(bgGraph, width/2, height/2);
  }

  if (isGrid) {
    drawGrid();
  }

  //textoCorrido
  if (isTextoCorrido) {
    for (int i=textos.size()-1; i>=0; i--) {
      Texto t=textos.get(i);
      t.update();
      t.display();
    }
  }

  if (isArvoresSecas) {
    is[0].run();
  } else {
    is[0].kill();
  }

  if (isCactus) {
    is[1].run();
  } else {
    is[1].kill();
  }

  if (isFolhagens01) {
    is[2].run();
  } else {
    is[2].kill();
  }

  if (isFolhagens02) {
    is[3].run();
  } else {
    is[3].kill();
  }

  if (isShatter) {
    is[4].run();
  } else {
    is[4].kill();
  }
  if (isEstatua01) {
    is[5].run();
  } else {
    is[5].kill();
  }
  if (isEstatua02) {
    is[6].run();
  } else {
    is[6].kill();
  }
  if (isDinheiro) {
    is[7].run();
  } else {
    is[7].kill();
  }
  if (isAlphabet) {
    is[8].run();
  } else {
    is[8].kill();
  }
  if (isAlien) {
    is[9].run();
  } else {
    is[9].kill();
  }
  
  for (int i=slogans.size()-1; i>=0; i--) {
    Slogan s=slogans.get(i);
    if (isSlogan) {
      s.update();
      s.display();
    }
  }


  //ring
  if (isRing) {
    if (frameCount%ringSpeed==0) r.addRing();
  }
  r.display();

  pointLight(255, 0, 0, 0, 0, 0);
  pointLight(255, 160, 0, 0, width, 0);
  pointLight(255, 0, 0, 0, height, 0);
  pointLight(0, 0, 255, width, height, 0);

  //heads
  if (isHead) {
    head.update();
    head.display();
  }
}

void keyPressed(){
 if(key=='s') saveFrame("saves/dome-####.png"); 
}
