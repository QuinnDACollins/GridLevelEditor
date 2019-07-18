Grid grid;
int typeSelect = 0;
int selectNum = 0;
int gridW, gridH;
int selectW, selectH;
String levelName = "";
boolean showHud = false;
boolean noPlayer = false;
Hud hud;
Util util;
Player p;
int[] props;
int ms, js, jh, ss;
ArrayList<Things> things = new ArrayList<Things>();
ArrayList<ErrorRelay> er = new ArrayList<ErrorRelay>();
PShader radialGrad;
PVector offset, poffset;

PImage[][] images;


void setup() {

  fullScreen(P3D);
  util = new Util();
  images = util.loadImages("default");
  gridW = width*10;
  gridH = height*10;
  selectW = images[0][0].width;
  selectH = images[0][0].height;
  grid = new Grid(things, gridW, gridH, 32, 32);
  
  hud = new Hud();
  offset = new PVector(0, 0);
  poffset = new PVector(0, 0);
  stroke(#96B792);

 

}

void draw() {
 
 background(#ffb2e8);

  if (mouseX >= width*.95) {
    offset.x -= 10 ;
  }
  if (mouseY >= height*.95) {
    offset.y -= 10 ;
  }
  if (mouseY <= height*.05) {
    offset.y += 10 ;
  }
  if (mouseX <= width*.05) {
    offset.x += 10 ;
  }
  pushMatrix();
  translate(offset.x, offset.y);
  grid.draw();

  for (int i =0; i < things.size(); i++) {
    things.get(i).draw();
  } 
  if(p != null){
  p.draw();
}
  popMatrix();
  if (showHud == true) {
    hud.displayArr(images);
    hud.displayName();
    hud.displayProperties();
  }
  
  for(ErrorRelay e: er){
    e.draw();
  }

}


void mousePressed() { 
  //if (showHud == false) { 
    grid.mousePressed();
  //}
  hud.mousePressed();
}


void keyPressed() {
  grid.keyPressed();

  if (hud.tbFocus == false) {

    if (key == 'h') {
      showHud = !showHud;
    }
  

  if (key == 'e') {
    if(typeSelect != 5){
       selectNum = constrain(selectNum +=1, 0, 8);
    }
    
  } else if (key == 'q') {
    if(typeSelect != 5){
       selectNum = constrain(selectNum -=1, 0, 8);
    }
   

  } else if (key == 'a') {

    try {
      typeSelect -=1;
      selectW = images[typeSelect][0].width;
      selectH = images[typeSelect][0].height;
      grid = new Grid(things, gridW, gridH, selectW, selectH);
      selectNum = 0;
    }
    catch(Exception e) {
      typeSelect = 0;
    }
  } else if (key == 'd') {
    try {
      typeSelect +=1;

      selectW = images[typeSelect][0].width;
      selectH = images[typeSelect][0].height;
      grid = new Grid(things, gridW, gridH, selectW, selectH);
      selectNum = 0;
    }
    catch(Exception e) {
      typeSelect = 0;
    }
  } else if (key =='p') {
    util.txtparser();
  
}
  
   else if(key == 'l'){
    util.loader(levelName);
    
  } else if(key =='t'){
    images = util.loadImages(levelName);
  }
}
  hud.keyPressed();
}

void mouseMoved(){
  grid.mouseMoved();
}


void mouseDragged() {


  grid.mouseDragged();
}
