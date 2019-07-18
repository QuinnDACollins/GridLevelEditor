class Hud {
  float tbX, tbY, tbW, tbH;
  boolean tbFocus = false;
  boolean msFocus = false;
  int propDex;
  String[] strProps;
  int chp, shp, jhp, mhp;
  Hud() {
    tbX = width*.8;
    tbY = 0;
    tbW = width*.2;
    tbH = height*.05;

    chp = 50;
    shp = 150;
    jhp = 100;
    mhp = 50;
    ms = 20;
    ss = 10;
    jh = 10;
    js = 10;
    props = new int[]{ms, ss, js, jh, chp};

    strProps = new String[]{"ms", "ss", "js", "jh", "hp"};
    propDex = 0;
    //displays the grid
  }

  void displayArr(PImage[][] arr) {
    for (int y = 0; y < arr.length; y +=1) {
      for (int x = 0; x < arr[y].length; x+=1) {
        print(y, x + "\n");
        try {


          image(arr[y][x], x*50 + ((50/width) * width) , y*50 + ((50/height) * height));
        }
        catch(Exception e) {
        }
      }
    }

    fill(200, 255, 200, 128);
    rect(selectNum * 50 +  ((50/width) * width), typeSelect * 50 +((50/height) * height), arr[typeSelect][selectNum].width * 1.1, arr[typeSelect][selectNum].height * 1.1);
  }

  void displayName() {
    fill(#FFFFFF);
    if (tbFocus == true) {
      strokeWeight(10);
      stroke(0, 0, 255);
    } else {
      strokeWeight(1);
      stroke(0);
    }
    rect(tbX, tbY, tbW, tbH);
    stroke(0);
    strokeWeight(0);
    fill(0);


    text(levelName, width*.82, height*.02);
  }

  void displayProperties(){
    for(int i = 0; i<props.length; i++){
      text(str(props[i]), width*.7+i*(width*.05), height*.7);
      text(strProps[i], width*.7+i*(width*.05), height*.68); 
    }
    fill(255, 0, 0, 128);
    
    rect(width*.7 + propDex*(width*.05), height*.705 - ((15/height) * height), 17, 5);
    

}

  void keyPressed() {
    if (tbFocus == true) {
      if ((key == DELETE || key == BACKSPACE) && levelName.length() > 0) {
        //A new String is created from using index 0 and the second to last index of the current text the player is typing
        levelName = levelName.substring(0, levelName.length() - 1);
      } else if (key != CODED && key != DELETE && key != BACKSPACE) {//else if the key is not a CODED key or the DELETE key or the BACKSPACE key
        //add the character of the key released to the text the players are typing
        levelName += key;
      }
    } 

    if((key == 'a') || (key == 'd')){
      switch(typeSelect){
         case 2:
            props[4] = 100;
            props[2] = 10;
            props[3] = 10;
            break;
          case 3:
            props[4] = 50;
            props[0] = 20;
            break;
          case 4:
            props[4] = 150;
            props[1] = 10;
            break;
      }
    }
    if(key == CODED){
        if(keyCode == LEFT){
          if(propDex == 0){
            propDex = 4;
          }
          propDex = constrain(propDex-=1, 0, 4);
        }else if(keyCode == RIGHT){
          if(propDex == 4){
            propDex = -1;
          }
          propDex = constrain(propDex+=1, 0, 4);
        }

        if(keyCode == UP){
          props[propDex] += 5;
        }else if(keyCode == DOWN){
          props[propDex] -= 5;
        }
}
  }

  void mousePressed() {
    if (mouseX > tbX && mouseX < tbX + tbW && mouseY >tbY && mouseY < tbH + tbY) {
      tbFocus = true;
    } else {
      tbFocus = false;
    }

  }
}
