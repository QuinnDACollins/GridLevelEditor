  class Shooter extends Things{

    Shooter(int cNum, int num, int thingX, int thingY, int thingW, int thingH, PImage thingImg, int shootSpeed, int _HP){
    super(cNum, num, thingX, thingY, thingW, thingH, thingImg);
    hp = _HP;
    ss = shootSpeed;
    type = "shooter";

  }
}