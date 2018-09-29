public class ControlFrame extends PApplet {

  ControlP5 cp5;
  Object parent;

  Textarea myTextarea;
  Println console;
  Slider amountHead;
  Slider showHead;
  Slider textoCorridoSize;
  Slider sloganSize;
  //LEAPGRID
  ButtonBar gShape;
  Knob gRed;
  Knob gGreen;
  Knob gBlue;

  CallbackListener cb;

  //GLOBAL VARIABLES
  int w, h;
  int oW, oH;

  //CP5 OBJECTS
  int prevText, actualText;
  int prevSlogan, actualSlogan;

  public void settings() {
    size(w, h);
  }

  public void setup() {
    cp5 = new ControlP5(this);

    //////////
    //TAB CENA
    //////////
    cp5.getTab("default")
      .setWidth(60)
      .setHeight(40)
      .activateEvent(true)
      .setColorActive(color(#FF6600))
      .setLabel(" ESTATUAS")
      .setId(0)
      .getCaptionLabel()
      .setFont(createFont("", 10))
      ;

    cp5.addTab("CENA1")
      .setWidth(60)
      .setHeight(40)
      .setColorActive(color(#FF6600))
      .activateEvent(true)
      .setLabel(" CENA 1 ")
      .setId(1)
      .getCaptionLabel()
      .setFont(createFont("", 10))
      ;

    cp5.addTab("CENA2")
      .setWidth(60)
      .setHeight(40)
      .setColorActive(color(#FF6600))
      .activateEvent(true)
      .setLabel(" CENA 2 ")
      .setId(2)
      .getCaptionLabel()
      .setFont(createFont("", 10))
      ;

    cp5.addTab("CENA3")
      .setWidth(60)
      .setHeight(40)
      .setColorActive(color(#FF6600))
      .activateEvent(true)
      .setLabel(" CENA 3 ")
      .setId(3)
      .getCaptionLabel()
      .setFont(createFont("", 10))
      ;
    cp5.addTab("CENA4")
      .setWidth(60)
      .setHeight(40)
      .setColorActive(color(#FF6600))
      .activateEvent(true)
      .setLabel(" CENA 4 ")
      .setId(4)
      .getCaptionLabel()
      .setFont(createFont("", 10))
      ;

    cp5.addTab("CENA5")
      .setWidth(60)
      .setHeight(40)
      .setColorActive(color(#FF6600))
      .activateEvent(true)
      .setLabel(" CENA 5 ")
      .setId(5)
      .getCaptionLabel()
      .setFont(createFont("", 10))
      ;

    cp5.addTab("global")
      .setAlwaysActive(true)
      ;

    cp5.getTab("CENA1")
      .setLabel(" RING ")
      .setId(1)
      ;

    cp5.getTab("CENA2")
      .setLabel(" GRADIENT ")
      .setId(2)
      ;

    cp5.getTab("CENA3")
      .setLabel(" TEXTAO ")
      .setId(3)
      ;

    cp5.getTab("CENA4")
      .setLabel(" SLOGAN ")
      .setId(4)
      ;

    cp5.getTab("CENA5")
      .setLabel(" IMAGENS ")
      .setId(5)
      ;

    cp5.getTab("global")
      .setAlwaysActive(true)
      ;

    /////////////
    //DEFAULT
    /////////////
    cp5.addToggle("headToggle")
      .setValue(false)
      .setPosition(140, 50)
      .setSize(120, 40)
      ;

    showHead=cp5.addSlider("showHead");
    showHead.setPosition(20, 110)
      .setSize(360, 15)
      .setRange(0, numEstatuas)
      .setValue(0)
      .setCaptionLabel("ESTATUA")
      .setNumberOfTickMarks(numEstatuas+1)
      ;

    amountHead=cp5.addSlider("amountHead");
    amountHead.setPosition(20, 140)
      .setSize(360, 15)
      .setRange(1, 8)
      .setValue(1)
      .setCaptionLabel("quantidade")
      .setNumberOfTickMarks(8)
      ;

    cp5.addSlider("amount_rotate")
      .setPosition(20, 170)
      .setSize(360, 15)
      .setRange(-.2, .2)
      .setValue(0)
      .setCaptionLabel("rotacao")
      .plugTo(parent, "posInc")
      ;

    cp5.addSlider("radius")
      .setPosition(20, 200)
      .setSize(360, 12)
      .setRange(0, oW)
      .setValue(0)
      .setCaptionLabel("radius")
      .plugTo(parent, "radius")
      ;


    cp5.addSlider("posZ")
      .setPosition(20, 230)
      .setSize(360, 12)
      .setRange(-600, 600)
      .setValue(0)
      .setCaptionLabel("pos_Z")
      .plugTo(parent, "posZ")
      ;

    cp5.addSlider("scale")
      .setPosition(20, 280)
      .setSize(360, 12)
      .setRange(0, 12)
      .setValue(1)
      .setCaptionLabel("scale")
      .plugTo(parent, "headScale")
      ;



    cp5.addSlider("rotX")
      .setPosition(20, 360)
      .setSize(160, 12)
      .setRange(-180, 180)
      .setValue(0)
      .setCaptionLabel("rot_X")
      .setNumberOfTickMarks(5)
      .plugTo(parent, "rotX")
      ;

    cp5.addSlider("incRX")
      .setPosition(220, 360)
      .setSize(160, 12)
      .setRange(-.1, .1)
      .setValue(0)
      .setCaptionLabel("INC_ROT_X")
      .plugTo(parent, "incRX")
      ;

    cp5.addSlider("rotY")
      .setPosition(20, 390)
      .setSize(160, 12)
      .setRange(-180, 180)
      .setValue(0)
      .setCaptionLabel("rot_Y")
      .plugTo(parent, "rotY")
      ;
    cp5.addSlider("incRY")
      .setPosition(220, 390)
      .setSize(160, 12)
      .setRange(-.1, .1)
      .setValue(0)
      .setCaptionLabel("INC_ROT_Y")
      .plugTo(parent, "incRY")
      ;

    cp5.addSlider("rotZ")
      .setPosition(20, 420)
      .setSize(160, 12)
      .setRange(-180, 180)
      .setValue(0)
      .setCaptionLabel("rot_Z")
      .setNumberOfTickMarks(5)
      .plugTo(parent, "rotZ")
      ;

    cp5.addSlider("incRZ")
      .setPosition(220, 420)
      .setSize(160, 12)
      .setRange(-.1, .1)
      .setValue(0)
      .setCaptionLabel("INC_ROT_Z")
      .plugTo(parent, "incRZ")
      ;

    cp5.getController("headToggle").moveTo("default");
    cp5.getController("headToggle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("showHead").moveTo("default");
    cp5.getController("showHead").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("amountHead").moveTo("default");
    cp5.getController("amountHead").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("amount_rotate").moveTo("default");
    cp5.getController("amount_rotate").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("radius").moveTo("default");
    cp5.getController("radius").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("posZ").moveTo("default");
    cp5.getController("posZ").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("scale").moveTo("default");
    cp5.getController("scale").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("rotX").moveTo("default");
    cp5.getController("rotX").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("rotY").moveTo("default");
    cp5.getController("rotY").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("rotZ").moveTo("default");
    cp5.getController("rotZ").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("incRX").moveTo("default");
    cp5.getController("incRX").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("incRY").moveTo("default");
    cp5.getController("incRY").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("incRZ").moveTo("default");
    cp5.getController("incRZ").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);

    /////////////
    //CENA 1
    /////////////
    cp5.addToggle("ringToggle")
      .setPosition(160, 50)
      .setSize(80, 80)
      .setValue(false)
      ;

    cp5.addSlider("ringSpeed")
      .setPosition(160, 150)
      .setRange(10, 120)
      .setSize(80, 12)
      .setValue(30)
      .plugTo(parent, "ringSpeed")
      ;

    cp5.addSlider("ringRed")
      .setPosition(160, 180)
      .setRange(0, 255)
      .setSize(80, 12)
      .setValue(255)
      .plugTo(parent, "ringRed")
      ;
    cp5.addSlider("ringGreen")
      .setPosition(160, 210)
      .setRange(0, 255)
      .setSize(80, 12)
      .setValue(255)
      .plugTo(parent, "ringGreen")
      ;
    cp5.addSlider("ringBlue")
      .setPosition(160, 240)
      .setRange(0, 255)
      .setSize(80, 12)
      .setValue(255)
      .plugTo(parent, "ringBlue")
      ;
    cp5.addSlider("ringThick")
      .setPosition(160, 240)
      .setRange(1, 8)
      .setSize(80, 12)
      .setValue(4)
      .plugTo(parent, "ringThick")
      ;

    cp5.getController("ringToggle").moveTo("CENA1");
    cp5.getController("ringSpeed").moveTo("CENA1");
    cp5.getController("ringSpeed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("ringRed").moveTo("CENA1");
    cp5.getController("ringRed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("ringGreen").moveTo("CENA1");
    cp5.getController("ringGreen").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("ringBlue").moveTo("CENA1");
    cp5.getController("ringBlue").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("ringThick").moveTo("CENA1");
    cp5.getController("ringThick").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);

    /////////////
    //CENA 2 
    /////////////
    cp5.addToggle("gradientToggle")
      .setPosition(80, 50)
      .setSize(80, 80)
      .setValue(true)
      .setLabel("VISIBLE")
      ;
    cp5.addBang("colorBang")
      .setPosition(200, 50)
      .setSize(80, 80)
      .setTriggerEvent(Bang.RELEASE)
      .setLabel("change Background")
      ;

    ////////////
    //LEAPGRID
    ////////////
    gShape=cp5.addButtonBar("mode")
      .setPosition(20, 150)
      .setSize(360, 20)
      .addItems(split("1 2 3 4 5 6", " "))
      ;

    gShape.changeItem("1", "text", "CIRC");
    gShape.changeItem("2", "text", "TRI");
    gShape.changeItem("3", "text", "HEX");
    gShape.changeItem("4", "text", "STAR");
    gShape.changeItem("5", "text", "DMND");
    gShape.changeItem("6", "text", "RECT");
    gShape.onMove(new CallbackListener() {
      public void controlEvent(CallbackEvent ev) {
        ButtonBar mode=(ButtonBar)ev.getController();
      }
    }
    );

    cp5.addToggle("gridToggle")
      .setPosition(40, 180)
      .setSize(40, 20)
      .setValue(false)
      .setLabel("GRID")
      ;

    gRed=cp5.addKnob("gRed")
      .setRange(0, 255)
      .setValue(255)
      .setPosition(130, 180)
      .setRadius(20)
      .setCaptionLabel("red")
      .setDragDirection(Knob.VERTICAL)
      .plugTo(parent, "rLG")
      ;

    gGreen=cp5.addKnob("gGreen")
      .setRange(0, 255)
      .setValue(255)
      .setPosition(220, 180)
      .setRadius(20)
      .setCaptionLabel("green")
      .setDragDirection(Knob.VERTICAL)
      .plugTo(parent, "gLG")
      ;

    gBlue=cp5.addKnob("gBlue")
      .setRange(0, 255)
      .setValue(255)
      .setPosition(310, 180)
      .setRadius(20)
      .setCaptionLabel("blue")
      .setDragDirection(Knob.VERTICAL)
      .plugTo(parent, "bLG")
      ;

    cp5.getController("gradientToggle").moveTo("CENA2");
    cp5.getController("colorBang").moveTo("CENA2");
    cp5.getController("mode").moveTo("CENA2");
    cp5.getController("gridToggle").moveTo("CENA2");
    cp5.getController("gRed").moveTo("CENA2");
    cp5.getController("gGreen").moveTo("CENA2");
    cp5.getController("gBlue").moveTo("CENA2");

    /////////////
    //CENA 3 
    /////////////
    cp5.addToggle("textoCorridoToggle")
      .setPosition(160, 50)
      .setSize(80, 80)
      .setValue(false)
      .setLabel("texto corrido")
      ;

    textoCorridoSize=cp5.addSlider("textoCorridoSize");
    textoCorridoSize.setPosition(160, 150)
      .setRange(0, 5)
      .setSize(80, 12)
      .setValue(0)
      .setNumberOfTickMarks(6)
      .plugTo(parent, "textoCorridoSize")
      ;

    cp5.addSlider("textoCorridoSpeed")
      .setPosition(160, 180)
      .setRange(10, 120)
      .setSize(80, 12)
      .setValue(15)
      .plugTo(parent, "textoCorridoSpeed")
      ;

    cp5.getController("textoCorridoToggle").moveTo("CENA3");
    cp5.getController("textoCorridoSize").moveTo("CENA3");
    cp5.getController("textoCorridoSpeed").moveTo("CENA3");

    /////////////
    //CENA 4 
    /////////////
    cp5.addToggle("sloganToggle")
      .setPosition(160, 50)
      .setSize(80, 80)
      .setValue(false)
      .setLabel("slogan")
      ;

    sloganSize=cp5.addSlider("sloganSize");
    sloganSize.setPosition(160, 150)
      .setRange(0, 5)
      .setSize(80, 12)
      .setValue(0)
      .setNumberOfTickMarks(6)
      .plugTo(parent, "sloganSize")
      ;

    cp5.addSlider("sloganSpeed")
      .setPosition(160, 180)
      .setRange(10, 120)
      .setSize(80, 12)
      .setValue(15)
      .plugTo(parent, "sloganSpeed")
      ;

    cp5.getController("sloganToggle").moveTo("CENA4");
    cp5.getController("sloganSize").moveTo("CENA4");
    cp5.getController("sloganSpeed").moveTo("CENA4");

    /////////////
    //CENA 5 
    /////////////
    cp5.addToggle("arvoresSecasToggle")
      .setPosition(20, 50)
      .setSize(40, 20)
      .setValue(false)
      .setLabel("arvoresSecas")
      ;
    cp5.addSlider("arvoresSecasSpeed")
      .setPosition(20, 100)
      .setRange(10, 120)
      .setSize(40, 12)
      .setValue(90)
      .plugTo(parent, "arvoresSecasSpeed")
      ;

    cp5.addToggle("cactusToggle")
      .setPosition(100, 50)
      .setSize(40, 20)
      .setValue(false)
      .setLabel("cactus")
      ;
    cp5.addSlider("cactusSpeed")
      .setPosition(100, 100)
      .setRange(10, 120)
      .setSize(40, 12)
      .setValue(90)
      .plugTo(parent, "cactusSpeed")
      ;

    cp5.addToggle("folhagem01Toggle")
      .setPosition(200, 50)
      .setSize(40, 20)
      .setValue(false)
      .setLabel("folhagem01")
      ;
    cp5.addSlider("folhagem01Speed")
      .setPosition(200, 100)
      .setRange(10, 120)
      .setSize(40, 12)
      .setValue(90)
      .plugTo(parent, "folhagens01Speed")
      ;

    cp5.addToggle("folhagem02Toggle")
      .setPosition(300, 50)
      .setSize(40, 20)
      .setValue(false)
      .setLabel("folhagem02")
      ;
    cp5.addSlider("folhagem02Speed")
      .setPosition(300, 100)
      .setRange(10, 120)
      .setSize(40, 12)
      .setValue(90)
      .plugTo(parent, "folhagens02Speed")
      ;

    cp5.addToggle("shatterToggle")
      .setPosition(20, 150)
      .setSize(40, 20)
      .setValue(false)
      .setLabel("shatter")
      ;
    cp5.addSlider("shatterSpeed")
      .setPosition(20, 190)
      .setSize(50, 12)
      .setRange(20, 120)
      .setCaptionLabel("speed")
      .setValue(60)
      .plugTo(parent, "shatterSpeed")
      ;

    cp5.addToggle("estatua01Toggle")
      .setPosition(100, 150)
      .setSize(40, 20)
      .setValue(false)
      .setLabel("estatua 01")
      ;
    cp5.addSlider("estatua01Speed")
      .setPosition(100, 190)
      .setSize(50, 12)
      .setRange(20, 120)
      .setCaptionLabel("speed")
      .setValue(60)
      .plugTo(parent, "estatua01Speed")
      ;

    cp5.addToggle("estatua02Toggle")
      .setPosition(200, 150)
      .setSize(40, 20)
      .setValue(false)
      .setLabel("estatua 02")
      ;
    cp5.addSlider("estatua02Speed")
      .setPosition(200, 190)
      .setSize(50, 12)
      .setRange(20, 120)
      .setCaptionLabel("speed")
      .setValue(60)
      .plugTo(parent, "estatua02Speed")
      ;

    cp5.addToggle("dinheiroToggle")
      .setPosition(300, 150)
      .setSize(40, 20)
      .setValue(false)
      .setLabel("dinheiro")
      ;
    cp5.addSlider("dinheiroSpeed")
      .setPosition(300, 190)
      .setSize(50, 12)
      .setRange(20, 120)
      .setCaptionLabel("speed")
      .setValue(60)
      .plugTo(parent, "dinheiroSpeed")
      ;

    cp5.addToggle("alphabetToggle")
      .setPosition(20, 250)
      .setSize(40, 20)
      .setValue(false)
      .setLabel("alphabet")
      ;
    cp5.addSlider("alphabetSpeed")
      .setPosition(20, 290)
      .setSize(50, 12)
      .setRange(20, 120)
      .setCaptionLabel("speed")
      .setValue(60)
      .plugTo(parent, "alphabetSpeed")
      ;
      
    cp5.addToggle("alienToggle")
      .setPosition(100, 250)
      .setSize(40, 20)
      .setValue(false)
      .setLabel("alien")
      ;
    cp5.addSlider("alienSpeed")
      .setPosition(100, 290)
      .setSize(50, 12)
      .setRange(20, 120)
      .setCaptionLabel("speed")
      .setValue(60)
      .plugTo(parent, "alienSpeed")
      ;

    cp5.addSlider("imageRadius")
      .setPosition(20, 400)
      .setSize(360, 12)
      .setRange(100, 400)
      .setCaptionLabel("radius")
      .setValue(400)
      .plugTo(parent, "imageRadius")
      ;

    cp5.getController("arvoresSecasToggle").moveTo("CENA5");
    cp5.getController("arvoresSecasToggle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("arvoresSecasSpeed").moveTo("CENA5");
    cp5.getController("arvoresSecasSpeed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("cactusToggle").moveTo("CENA5");
    cp5.getController("cactusToggle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("cactusSpeed").moveTo("CENA5");
    cp5.getController("cactusSpeed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("folhagem01Toggle").moveTo("CENA5");
    cp5.getController("folhagem01Toggle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("folhagem01Speed").moveTo("CENA5");
    cp5.getController("folhagem01Speed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("folhagem02Toggle").moveTo("CENA5");
    cp5.getController("folhagem02Toggle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("folhagem02Speed").moveTo("CENA5");
    cp5.getController("folhagem02Speed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("shatterToggle").moveTo("CENA5");
    cp5.getController("shatterToggle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("shatterSpeed").moveTo("CENA5");
    cp5.getController("shatterSpeed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("estatua01Toggle").moveTo("CENA5");
    cp5.getController("estatua01Toggle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("estatua01Speed").moveTo("CENA5");
    cp5.getController("estatua01Speed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("estatua02Toggle").moveTo("CENA5");
    cp5.getController("estatua02Toggle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("estatua02Speed").moveTo("CENA5");
    cp5.getController("estatua02Speed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("dinheiroToggle").moveTo("CENA5");
    cp5.getController("dinheiroToggle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("dinheiroSpeed").moveTo("CENA5");
    cp5.getController("dinheiroSpeed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("alphabetToggle").moveTo("CENA5");
    cp5.getController("alphabetToggle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("alphabetSpeed").moveTo("CENA5");
    cp5.getController("alphabetSpeed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
       cp5.getController("alienToggle").moveTo("CENA5");
    cp5.getController("alienToggle").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("alienSpeed").moveTo("CENA5");
    cp5.getController("alienSpeed").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
    cp5.getController("imageRadius").moveTo("CENA5");
    cp5.getController("imageRadius").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);

    //////////
    ///
    /// CALLBACK LISTENER
    ///
    //////////
    cb = new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        switch(theEvent.getAction()) {
          case(ControlP5.ACTION_ENTER):
          cursor(HAND);
          break;
          case(ControlP5.ACTION_LEAVE):
          case(ControlP5.ACTION_RELEASE_OUTSIDE):
          cursor(ARROW);
          break;
        }
      }
    };    
    cp5.addCallback(cb);

    amountHead.addCallback(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        if (theEvent.getAction()==ControlP5.ACTION_RELEASE) {
          int v=int(theEvent.getController().getValue());  
          prevHeadAmount=headAmount;
          headAmount=v;
          clearHeads(headAmount, prevHeadAmount);
        }
      }
    }
    );

    showHead.addCallback(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        if (theEvent.getAction()==ControlP5.ACTION_RELEASE) {
          int v=int(theEvent.getController().getValue());  
          headDisplay=v;
          head.refreshHead(headDisplay);
        }
      }
    }
    );

    textoCorridoSize.addCallback(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        if (theEvent.getAction()==ControlP5.ACTION_RELEASE) {
          prevText=actualText;
          int v=int(theEvent.getController().getValue());  
          actualText=v;
          textoCorridoSpawn(actualText, prevText);
        }
      }
    }
    );

    sloganSize.addCallback(new CallbackListener() {
      public void controlEvent(CallbackEvent theEvent) {
        if (theEvent.getAction()==ControlP5.ACTION_RELEASE) {
          prevSlogan=actualSlogan;
          int v=int(theEvent.getController().getValue());  
          actualSlogan=v;
          sloganSpawn(actualSlogan, prevSlogan);
        }
      }
    }
    );


    //////////
    ///
    /// CONSOLE
    ///
    //////////
    myTextarea = cp5.addTextarea("txt")
      .setPosition(20, height-400)
      .setSize(360, 360)
      .setFont(createFont("", 10))
      .setLineHeight(14)
      .setColor(color(200))
      .setColorBackground(color(32))
      .setColorForeground(color(255, 100));

    ;

    console = cp5.addConsole(myTextarea);
    //cp5.getController("myTextarea").moveTo("global");
  }

  public void draw() {
    background(0);
  }

  void controlEvent(ControlEvent theControlEvent) {
    if (theControlEvent.isTab()) {
      println("got an event from tab : "+theControlEvent.getTab().getName()+" with id "+theControlEvent.getTab().getId());
    }
  }

  void controlEvent(CallbackEvent theEvent) {
    if (theEvent.getController().equals(amountHead)) {
      switch(theEvent.getAction()) {
        case(ControlP5.ACTION_ENTER): 
        println("MODE : ENTER");
        break;
        case(ControlP5.ACTION_LEAVE): 
        println("MODE :LEAVE");
        break;
        case(ControlP5.ACTION_PRESS): 
        //println("Action:PRESS");
        break;
        case(ControlP5.ACTION_RELEASE): 
        println("MODE : RELEASE");
        break;
        case(ControlP5.ACTION_RELEASE_OUTSIDE): 
        //println("Action:RELEASED OUTSIDE");
        break;
        case(ControlP5.ACTION_BROADCAST): 
        //println("Action:BROADCAST");
        break;
      }
    }
  }

  void gradientToggle(boolean toggle) {
    if (toggle==true) {
      isGradient=true;
    } else {
      isGradient=false;
    }
  }

  public void colorBang() {
    buildBackground();
  }

  void gridToggle(boolean toggle) {
    if (toggle==true) {
      isGrid=true;
    } else {
      isGrid=false;
    }
  }

  void headToggle(boolean toggle) {
    if (toggle==true) {
      isHead=true;
    } else {
      isHead=false;
    }
  }

  void ringToggle(boolean toggle) {
    if (toggle==true) {
      isRing=true;
    } else {
      isRing=false;
    }
  }

  void textoCorridoToggle(boolean toggle) {
    if (toggle==true) {
      isTextoCorrido=true;
    } else {
      isTextoCorrido=false;
      cp5.getController("textoCorridoSize").setValue(0);
      prevText=0;
      actualText=0;
      clearTextoCorrido();
    }
  }

  void sloganToggle(boolean toggle) {
    if (toggle==true) {
      isSlogan=true;
    } else {
      isSlogan=false;
      cp5.getController("sloganSize").setValue(0);
      prevSlogan=0;
      actualSlogan=0;
    }
  }

  void arvoresSecasToggle(boolean toggle) {
    if (toggle==true) {
      isArvoresSecas=true;
    } else {
      isArvoresSecas=false;
    }
  }

  void cactusToggle(boolean toggle) {
    if (toggle==true) {
      isCactus=true;
    } else {
      isCactus=false;
    }
  }

  void folhagem01Toggle(boolean toggle) {
    if (toggle==true) {
      isFolhagens01=true;
    } else {
      isFolhagens01=false;
    }
  }

  void folhagem02Toggle(boolean toggle) {
    if (toggle==true) {
      isFolhagens02=true;
    } else {
      isFolhagens02=false;
    }
  }

  public void shatterToggle(boolean toggle) {
    if (toggle==true) {
      isShatter=true;
    } else {
      isShatter=false;
    }
  }

  public void estatua01Toggle (boolean toggle) {
    if (toggle==true) {
      isEstatua01=true;
    } else {
      isEstatua01=false;
    }
  }

  public void estatua02Toggle(boolean toggle) {
    if (toggle==true) {
      isEstatua02=true;
    } else {
      isEstatua02=false;
    }
  }

  public void dinheiroToggle(boolean toggle) {

    if (toggle==true) {
      isDinheiro=true;
    } else {
      isDinheiro=false;
    }
  }

  public void alphabetToggle(boolean toggle) {

    if (toggle==true) {
      isAlphabet=true;
    } else {
      isAlphabet=false;
    }
  }
  
  public void alienToggle(boolean toggle) {

    if (toggle==true) {
      isAlien=true;
    } else {
      isAlien=false;
    }
  }

  public void mode(int theValue) {
    mode=theValue;
  }

  public ControlFrame(PApplet _parent, int _w, int _h, String _name, int _oW, int _oH) {
    super();   
    parent = _parent;
    w=_w;
    h=_h;
    PApplet.runSketch(new String[]{this.getClass().getName()}, this);
    oW=_oW;
    oH=_oH;
  }


  public ControlP5 control() {
    return cp5;
  }
}
