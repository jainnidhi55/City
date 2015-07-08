
ArrayList city = new ArrayList();
ArrayList grayCity = new ArrayList();
ArrayList whiteCity = new ArrayList();
ArrayList creatures = new ArrayList();
int speed = 5;
int graySpeed = 2;
int whiteSpeed = 1;
int creatureSpeed = 4;
int creature2Speed = 6;
int creatureXCOR = 500;
int creatureXCOR2 = 600;
int canvW = 600;
int canvH= 600;
int buildR = 0;
int buildG = 0;
int buildB = 0;
int grayBuildR = 87;
int grayBuildG = 82;
int grayBuildB = 84;
int whiteBuildR = 166;
int whiteBuildG = 158;
int whiteBuildB = 166;
int buildNum = 200;
int creatureNum = 1;
int variationH = 101;
int variationW = 41;
int blackH = 140;
int grayH = 220;
int whiteH = 300;
int withy = 10;
int starcount = 6;
int personX = 25;
int personY = 515;
int countPersonJump = 0;
boolean fall=false;
boolean up=false;
int creatureW = 50;
int creatureH = 30;
PImage creaturePic;
int counterCRE = 0;
boolean bubble = false;
void setup(){
  noStroke();
  size(600, 600);
 
  //white buildings
  int endWWhite = 0;
  int prevBuildWWhite=0;
  for(int i=0; i<buildNum;i++){
  int randH = (int) (Math.random()*variationH + whiteH);
  int randW = (int) (Math.random()*variationW +withy);
  endWWhite += prevBuildWWhite;
  whiteCity.add(new Building(endWWhite, canvH-randH, randW, randH, whiteBuildR, whiteBuildG, whiteBuildB));
  prevBuildWWhite = whiteCity.get(i).width;
  }
  //white buildings end
 
  //gray buildings
  int endWGray = 0;
  int prevBuildWGray=0;
  for(int i=0; i<buildNum;i++){
  int randH = (int) (Math.random()*variationH + grayH);
  int randW = (int) (Math.random()*variationW +withy);
  endWGray += prevBuildWGray;
  grayCity.add(new Building(endWGray, canvH-randH, randW, randH, grayBuildR, grayBuildG, grayBuildB));
  prevBuildWGray = grayCity.get(i).width;
  }
  //gray buildings end
 
  //black buildings
  int endW = 0;
  int prevBuildW=0;
  for(int i=0; i<buildNum;i++){
  int randH = (int) (Math.random()*variationH + blackH);
  int randW = (int) (Math.random()*variationW +withy);
  endW += prevBuildW;
  city.add(new Building(endW, canvH-randH, randW, randH, buildR, buildG, buildB));
  prevBuildW = city.get(i).width;
  }
  //black buildings end
 
 
 
  //moon
  String url = "http://www.evenflowbarandgrill.com/images/flyers/Moonday.png";
  moon = loadImage(url, "png");
  //moon end
 
  //shooting star
  String url1="http://www.seamepost.com/wp-content/uploads/2013/08/72145.jpg";
  star=loadImage(url1, "jpg");
  //shooting star end
 
  //walking person
  String url2 = "http://www.meondirect.com/media/catalog/product/cache/2/image/9df78eab33525d08d6e5fb8d27136e95/w/a/walking_man_3_1.jpg";
  person = loadImage(url2, "jpg");
 
  String url3 = "http://www.wonderweirded-creatures.com/images/free-halloween-clipart-vampire-bat-emoxi-2.gif";
  creaturePic = loadImage(url3, "png");
 
  //creature
  /*int prevCX = 300;
  for(int i=0; i<creatureNum;i++){
  int space = (int) (Math.random()*51 +100);
  creatures.add(prevCX + space);
  prevCX = creatures.get(i);*/
  image (creaturePic, 500, 550, 30, 30);
  //}
  //creature end
 
}
void draw(){
  background(72, 71, 125);
 
  //shooting star
  image (star, 0, -60, 600, 600);
  //shooting star end
 
  //stars
  if(starcount%6==0)
  {
   for(int i=0; i<100; i++)
   {
   int locx=(int)(Math.random()*601);
   int locy=(int)(Math.random()*301);
   int starW=3;
   int starH=3;
   fill(242, 247, 102);
   ellipse(locx, locy, starW, starH);
   }
  }
  starcount++;
  //stars end
 
 
  //moon pic
  image(moon, 15, 10, 100, 100);
  //moon pic end
 
  //white building
  for (int i=0; i<whiteCity.size(); i++){
  whiteCity.get(i).drawRect();
  int newX = whiteCity.get(i).getX() - whiteSpeed;
  if (newX + whiteCity.get(i).getWidth() < -100)
  {
    whiteCity.remove(whiteCity.get(i));
    int randH = (int) (Math.random()*variationH + whiteH);
    int randW = (int) (Math.random()*variationW +withy);
    whiteCity.add(new Building(canvW, canvH-randH, randW, randH, whiteBuildR, whiteBuildG, whiteBuildB));
  }
  else
  {
    whiteCity.get(i).setX(whiteCity.get(i).getX() - whiteSpeed);
  }
  }
  //white building end
 
  //gray building
  for (int i=0; i<grayCity.size(); i++){
  grayCity.get(i).drawRect();
  int newX = grayCity.get(i).getX() - graySpeed;
  if (newX + grayCity.get(i).getWidth() < -100)
  {
    grayCity.remove(grayCity.get(i));
    int randH = (int) (Math.random()*variationH + grayH);
    int randW = (int) (Math.random()*variationW +withy);
    grayCity.add(new Building(canvW, canvH-randH, randW, randH, grayBuildR, grayBuildG, grayBuildB));
  }
  else
  {
    grayCity.get(i).setX(grayCity.get(i).getX() - graySpeed);
  }
  }
  //gray building end
 
  //black building
  for (int i=0; i<city.size(); i++){
  city.get(i).drawRect();
  int newX = city.get(i).getX() - speed;
  if (newX + city.get(i).getWidth() < -100)
  {
    city.remove(city.get(i));
    int randH = (int) (Math.random()*variationH + blackH);
    int randW = (int) (Math.random()*variationW +withy);
    city.add(new Building(canvW, canvH-randH, randW, randH, buildR, buildG, buildB));
  }
  else
  {
    city.get(i).setX(city.get(i).getX() - speed);
  }
  }
  //black building end
 
  //person
  image (person, personX, personY, 50, 80);
  //person end
 
  //person jumping
  if (keyPressed){
  up = true;
  } 
  if (up == true){
  if (fall== false && personY > 400){
    personY -= 5;
    image (person, personX, personY, 50, 80);
    if (personY == 400){
      fall = true;
    }
  }
  if (fall == true && personY>=400){
    //alert("hey");
    personY +=5;
    image (person, personX, personY, 50, 80);
    if (personY == 515){
      up = false;
      fall = false;
    }
  }
  }
  //person jumping end
 
  //creature
  /*for (int i=0; i<creatures.size(); i++){ 
  image(creaturePic, xVal, 550, 40, 40);
  int newX = creatures.get(i) - creatureSpeed;
  if (newX + creatureW < -100)
  {
    int space = (int) (Math.random()*51 + 100);
    creatures.remove(creatures.get(i));
    creatures.add(600 + space);
  }
  else
  {
    creatures.set(i, creatures.get(i) - creatureSpeed);
  }
  } */
  //creature end
  /*int prevCX = 300;
  for(int i=0; i<creatureNum;i++){
  int space = (int) (Math.random()*51 +100);
  creatures.add(prevCX + space);
  prevCX = creatures.get(i);*/
  //}
  //CREATURE
  image (creaturePic, creatureXCOR, 560, 30, 30);
  creatureXCOR -= creatureSpeed;
  if (creatureXCOR <= 0){
  creatureXCOR = 550;
  }
 
  counterCRE++;
  if (counterCRE % 500 == 0){
  bubble = true;
  }
 
  if (bubble){
  image (creaturePic, creatureXCOR2, 560, 30, 30);
  creatureXCOR2-= creature2Speed;
  if (creatureXCOR2 <= 0){
    creatureXCOR2 = 550;
  }
  }
 
  //CREATURE
 
  //if creature = person
  if ((creatureXCOR - personX >= -5) && (creatureXCOR - personX <= 5) && (personY <= 560) && (personY >= 510)){
  alert("you lost :(");
  } 
  if ((creatureXCOR2 - personX >= -5) && (creatureXCOR2 - personX <= 5) && (personY <= 560) && (personY >= 510)){
  alert("you lost");
  }
 
  if (counterCRE % 100 == 0){
  creature2Speed += 0.5;
  }
 
  if (counterCRE % 500 == 0){
  creature2Speed += 0.5;
  }
 
}
 
 

class Building{
  int xVal;
  int yVal;
  int width;
  int height;
  int r;
  int g;
  int b;
  Building(int x, int y, int w, int h,int red, int green, int blue){
  xVal = x;
  yVal = y;
  width = w;
  height = h;
  r = red;
  g = green;
  b = blue;
  }
 
  void drawRect(){
  fill (r, g, b);
  rect(xVal, yVal, width, height);  
  }
 
  void setX(int x){
  xVal = x;
  }
 
  void setWidth(int wid){
  width = wid;
  }
 
  int getX(){
  return xVal;
  }
 
  int getWidth(){
  return width;
  }
}
/*class Creature{
  int xVal;
  int yVal;
  Creature(int x, int y){
  xVal = x;
  yVal = y;
  }
 
  void drawCreature(){
  alert("creature");
  image(creaturePic, xVal, yVal, creatureW, creatureH);
  }
 
  int getXVal(){
  return xVal;
  }
 
  void setXVal(int a){
  xVal = a;
  }
}*/



