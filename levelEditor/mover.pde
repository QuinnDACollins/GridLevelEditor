  class Mover extends Things{
  
    Mover(int cNum, int num, int thingX, int thingY, int thingW, int thingH, PImage thingImg, int moveSpeed, int _HP){
      super(cNum, num, thingX, thingY, thingW, thingH, thingImg);
      hp = _HP;
      ms = moveSpeed;
      type = "mover";

    }
  }