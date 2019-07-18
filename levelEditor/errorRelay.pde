  class ErrorRelay{
   int a;
   String err;

  ErrorRelay(String error){
      a = 200;
     err = error;
     println("Created a thing");
}

void draw(){
  textAlign(CENTER);
  fill(255, 0, 0,a);
  textSize(32);
  text(err, width/2, height/2);
   a -= 4;
  textAlign(LEFT);
  textSize(12);
  if(a == 0){
    err = "";
  }
}
}