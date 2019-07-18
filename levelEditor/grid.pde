class Grid {

  class Cell {
    //Shapes to be added to the grid.
    int x, y, w, h;
    String theType;
    boolean placed, colliding, alreadyTouched;
    color c;

    Cell(int cellX, int cellY, int cellW, int cellH) {
      alreadyTouched = false;
      x = cellX;
      y = cellY;
      w = cellW;
      h = cellH;
    }
    void draw() {

      if (colliding == true) {
        fill(255, 255, 255, 125);
        rect(x, y, w, h);
      }




      if ((mouseX - offset.x > x) && (mouseX - offset.x < x + w)
        && (mouseY - offset.y > y) && (mouseY - offset.y < y + h)) {
        colliding = true;
      } else {
        colliding = false;
      }
    }
    void mousePressed() {

      if ((colliding) && (placed == true)) {
        placed = false;
      } else if (colliding == true) {
        placed = true;
      }
    }



    void mouseDragged() {

      if (colliding == true) {
        placed = true;
      }
    }
  }



  ArrayList<Cell> cells = new ArrayList<Cell>();
  color c;
  int gridW, gridH, tW, tH;

  boolean toParse;
  ArrayList<Things> t;
  boolean eraser;
  Grid(ArrayList<Things> thingsList, int areaX, int areaY, int tileW, int tileH) {
    gridW = areaX;
    gridH = areaY;
    tW = tileW;
    tH = tileH;

    t = thingsList;

    for (int y =0; y < gridH; y+= tH) {
      for (int x = 0; x < gridW; x += tW) {

        cells.add(new Cell(x, y, tW, tH));
      }
    }
  }

  void draw() {
    fill(128);
    stroke(255, 255, 0);
    rect(0, 0, gridW, gridH);
    noStroke();
    for (int i = 0; i < cells.size(); i+=1) {
      cells.get(i).draw();


      if (cells.get(i).colliding == false) {
        cells.get(i).alreadyTouched = false;
      }
    }
  }

  void update() {
  }


  void mousePressed() {

    for (int i = 0; i < cells.size(); i+=1) {
      if (cells.get(i).colliding == true && cells.get(i).alreadyTouched == false) {
        cells.get(i).alreadyTouched = true;
        switch(typeSelect) {
          case 0:
            t.add(new Tile(i, selectNum, cells.get(i).x, cells.get(i).y, tW, tH, images[typeSelect][selectNum]));
            break;
          case 1:
            t.add(new Wall(i, selectNum, cells.get(i).x, cells.get(i).y, tW, tH, images[typeSelect][selectNum]));
            break;
          case 2:
            t.add(new Mover(i, selectNum, cells.get(i).x, cells.get(i).y, tW, tH, images[typeSelect][selectNum],props[0], props[4]));
            break;
          case 3:
            t.add(new Jumper(i, selectNum, cells.get(i).x, cells.get(i).y, tW, tH,images[typeSelect][selectNum], js, jh, props[4]));
            break;
          case 4:
            t.add(new Shooter(i, selectNum, cells.get(i).x, cells.get(i).y, tW, tH, images[typeSelect][selectNum], props[1], props[4]));
            break;
          case 5:
            p = new Player(i, selectNum, cells.get(i).x, cells.get(i).y, tW, tH, images[typeSelect][selectNum]);
        }
    }
        
      }
    }
  void keyPressed(){
        if(key == BACKSPACE){
       
        eraser = !eraser;
        }
      }
  

void mouseMoved(){
if(eraser == true){
   for (int x = 0; x < t.size(); x+=1) {
          if (t.get(x).colliding()) {
            t.remove(x);
          }
        }
  if(p != null){
  if(p.colliding()){
    p = null;
  }
  }
}
}




  void mouseDragged() {

    for (int i = 0; i < cells.size(); i += 1) {
      cells.get(i).mouseDragged();

      if (cells.get(i).colliding == true && cells.get(i).alreadyTouched == false) {
        cells.get(i).alreadyTouched = true;
         switch(typeSelect) {
          case 0:
            t.add(new Tile(i, selectNum, cells.get(i).x, cells.get(i).y, tW, tH, images[typeSelect][selectNum]));
            break;
          case 1:
            t.add(new Wall(i, selectNum, cells.get(i).x, cells.get(i).y, tW, tH, images[typeSelect][selectNum]));
            break;
          case 2:
            t.add(new Jumper(i, selectNum, cells.get(i).x, cells.get(i).y, tW, tH,images[typeSelect][selectNum], js, jh, props[4]));
            break;
          case 3:
            t.add(new Mover(i, selectNum, cells.get(i).x, cells.get(i).y, tW, tH, images[typeSelect][selectNum],ms, props[4]));
            break;
          case 4:
            t.add(new Shooter(i, selectNum, cells.get(i).x, cells.get(i).y, tW, tH, images[typeSelect][selectNum], ss, props[4]));
            break;
        }
    }
  }
}
}
