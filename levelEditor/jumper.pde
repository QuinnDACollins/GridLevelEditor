  class Jumper extends Things{
  
    Jumper(int cNum, int num, int thingX, int thingY, int thingW, int thingH, PImage thingImg, int jumpSpeed, int jumpHeight, int _HP){
    super(cNum, num, thingX, thingY, thingW, thingH, thingImg);
    hp = _HP;
    js = jumpSpeed;
    jh = jumpHeight;
    type = "jumper";
}
}
