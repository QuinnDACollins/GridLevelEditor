class Things {

  int x, y;
  String type;
  PImage img;
  int selectNum;
  int cellNum;
  int imgW, imgH;
  int ms, js, jh, ss;
  int hp;
  Things(int cNum, int num, int thingX, int thingY, int thingW, int thingH, PImage thingImg){
    cellNum = cNum;
    x = thingX;
    y = thingY;
    img = thingImg;
    selectNum = num;
  }



  void draw() {
    image(img, x, y);
  }


  boolean colliding() {
    if ((mouseX - offset.x > x) && (mouseX - offset.x < x + img.width)
      && (mouseY - offset.y > y) && (mouseY - offset.y < y + img.height)) {
      return true;
    } else {
      return false;
    }
  }
}
