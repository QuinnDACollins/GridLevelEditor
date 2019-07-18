class Util{
	
	Util(){
	
	}
void txtparser() {
  String[] toFile;

  ArrayList<String> entities = new ArrayList<String>();


  for (int i = 0; i < things.size(); i+=1) {
   switch(things.get(i).type){
    case "tile":
      entities.add(new String((things.get(i).type) + things.get(i).selectNum + ", " + str(things.get(i).x) + ", " +  str(things.get(i).y) + ", " + str(things.get(i).img.width) 
        + ", " + str(things.get(i).img.height) + ", " + str(things.get(i).cellNum)));
      break;

    case "wall":
      entities.add(new String((things.get(i).type) + things.get(i).selectNum + ", " + str(things.get(i).x) + ", " +  str(things.get(i).y) + ", " + str(things.get(i).img.width) 
        + ", " + str(things.get(i).img.height) + ", " + str(things.get(i).cellNum)));
      break;

    case "mover":
      entities.add(new String((things.get(i).type) + things.get(i).selectNum + ", " + str(things.get(i).x) + ", " +  str(things.get(i).y) + ", " + str(things.get(i).img.width) 
        + ", " + str(things.get(i).img.height) + ", "+ str(things.get(i).ms) + ", " + str(things.get(i).hp) + ", " + str(things.get(i).cellNum)));
      break;
    case "jumper":
      entities.add(new String((things.get(i).type) + things.get(i).selectNum + ", " + str(things.get(i).x) + ", " +  str(things.get(i).y) + ", " + str(things.get(i).img.width) 
        + ", " + str(things.get(i).img.height) +", " + str(things.get(i).js) + ", " + str(things.get(i).jh) + ", " + str(things.get(i).hp) + ", " + str(things.get(i).cellNum)));
      break;
    case "shooter":
      entities.add(new String((things.get(i).type) + things.get(i).selectNum + ", " + str(things.get(i).x) + ", " +  str(things.get(i).y) + ", " + str(things.get(i).img.width) 
        + ", " + str(things.get(i).img.height) + ", " + str(things.get(i).ss) + ", " + str(things.get(i).hp) + ", " + str(things.get(i).cellNum)));
      break;

   }
   }



  toFile = new String[entities.size()+5];
  toFile[0] = "#title";
  toFile[1] = levelName;
  toFile[2] = "Game";
  toFile[3] = "0, 0";
  toFile [4] = "#entities in format: type(imageNum), x, y, w, h, ms/ss/js, (jh), HP, cellNumber";
  //Player
  try{
  toFile[5] = "player" + p.selectNum + ", " + p.x + ", " +  p.y + ", " + p.img.width
        + ", " + p.img.height;
      }catch(Exception e){
        noPlayer = true;
        er.add(new ErrorRelay("You must place a player in the level before saving!"));
      }
  for (int i = 6; i < toFile.length; i+=1) {
    toFile[i] = entities.get(i-5);
  }

  saveStrings("data/yourLevels/"+ levelName + ".cfg", toFile);
  er.add(new ErrorRelay("Saved Level: " + levelName));
}

void loader(String fileName){
  File loadingFile = new File(dataPath("yourLevels/" + fileName +".cfg"));

  if(loadingFile.isFile()){
	String[] toLoad = loadStrings("data/yourLevels/" + fileName +".cfg");

	for(int a = 4; a < toLoad.length; a++){
	String[] pieces = split(toLoad[a].trim(), ", ");

	String type = (pieces[0].substring(0, pieces[0].length()-1)); //The first String the type of entity
    int loadNum = int(pieces[0].substring(pieces[0].length()-1));
    int ex = int(pieces[1]); //The seconds String its x location
    int ey = int(pieces[2]); //The thrid String its y location
    int ew = int(pieces[3]); //The fourth String its width
    int eh = int(pieces[4]); //The fifth String its height
    int cNum = int(pieces[pieces.length -1]);
	  switch(type) {
          case "tile":
          	
            things.add(new Tile(cNum, selectNum, ex, ey, ew, eh, images[0][loadNum]));
            break;
          case "wall":
          
            things.add(new Wall(cNum, selectNum, ex, ey, ew, eh,images[1][loadNum]));
            break;
          case "mover":
          	int ms = int(pieces[5]);
          	
            things.add(new Mover(cNum, selectNum, ex, ey, ew, eh, images[3][loadNum],ms, props[4]));
            break;
          case "jumper":
          	int js = int(pieces[5]);
            int jh = int(pieces[6]);  
        
            things.add(new Jumper(cNum, selectNum, ex, ey, ew, eh, images[2][loadNum], js, jh, props[4]));
            break;
          case "shooter":
          	int ss = int(pieces[5]);
          
            things.add(new Shooter(cNum, selectNum, ex, ey, ew, eh, images[4][loadNum], ss, props[4]));
            break;
        }
    }
  }else{
    er.add(new ErrorRelay("That's not an existing file!"));
  }
}


PImage[][] loadImages(String name) {
	PImage[][] images = new PImage[6][9];
	images[5][0] = loadImage(dataPath("player.png"));
  	for (int i = 0; i < 9; i++) {
    File tileToLoad = new File(dataPath(name + "/tiles/tile" + str(i) + ".png"));
    
    if (tileToLoad.isFile() == true) {
      images[0][i] = loadImage(dataPath(name + "/tiles/tile" + str(i) + ".png"));
      images[0][i].resize(32, 32);
    } else{
      
      images[0][i] = loadImage(dataPath("errTile.png"));
    }
  }

  for(int i = 0; i < 9; i++){
    File wallToLoad = new File(dataPath(name + "/tiles/wall" + str(i) + ".png"));
    if (wallToLoad.isFile() == true) {
      images[1][i] = loadImage(dataPath(name + "/tiles/wall" + str(i) + ".png"));
      images[1][i].resize(32, 32);
    } else {
      images[1][i] = loadImage(dataPath("errTile.png"));
    }
  }
  for (int i = 0; i < 9; i++) {
  File entityToLoad = new File(dataPath(name + "/jumper/jumper" + str(i) + ".png"));
    if (entityToLoad.isFile() == true) {
      images[2][i] =  loadImage(dataPath(name + "/jumper/jumper" + str(i) + ".png"));
      images[2][i].resize(32, 32);
     } else{
      images[2][i] = loadImage(dataPath("errEntity.png"));
}
 }
 for (int i = 0; i < 9; i++) {
  File entityToLoad = new File(dataPath(name + "/mover/mover" + str(i) + ".png"));
    if (entityToLoad.isFile() == true) {
      images[3][i] =  loadImage(dataPath(name +"/mover/mover" + str(i) + ".png"));
      images[3][i].resize(32, 32);
     } else{
      images[3][i] = loadImage(dataPath( "errEntity.png"));
}
 }
 for (int i = 0; i < 9; i++) {
  File entityToLoad = new File(dataPath(name +"/shooter/shooter" + str(i) + ".png"));
    if (entityToLoad.isFile() == true) {
      images[4][i] =  loadImage(dataPath(name +"/shooter/shooter" + str(i) + ".png"));
      images[4][i].resize(32, 32);
     } else{
      images[4][i] = loadImage(dataPath("errEntity.png"));
}
 }
  return images;
}


}