void initBackground() {
  int cW=int(width*1.25);
  int cH=int(height*1.25);
  bgGraph=createGraphics(cW, cH);
  buildBackground();
}

void buildBackground() {
  buildCanvas(bgGraph);
}

void buildCanvas(PGraphics pg) {
  pg.beginDraw();
  buildGradient(bgGraph, bgGraph.height/2, bgGraph.width/2, bgGraph.width);
  pg.endDraw();
}

void buildGradient(PGraphics bgGraph, int y, int x, int size) {
  color c1=bgGraphColors[int(random(bgGraphColors.length))];
  color c2=bgGraphColors[int(random(bgGraphColors.length))];
  if (c2==c1) {
    c2=bgGraphColors[int(random(bgGraphColors.length))];
  } 

  bgGraph.noStroke();

  for (int i=size; i>0; i--) {
    float c=map(i, 0, size, 0.0, 1.0);
    color cF=lerpColor(c1, c2, c);
    bgGraph.fill(cF);
    bgGraph.ellipse(x, y, i, i);
  }
}
