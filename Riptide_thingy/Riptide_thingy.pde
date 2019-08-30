int count = 0;
void setup(){

  size(700,700);
  frameRate(30);
  background(32,48,96);
}

/*



*/

void draw(){
  /*
  if(mousePressed == true){
    saveFrame("screenshot.png");
    count = 0;
    background(89,103,132);
  }*/



}
void mouseClicked(){
  int x = mouseX;
  int y = mouseY;
  new Drop(x,y,700).display(count);
  count++;

}

void keyPressed(){

    saveFrame("screenshot.png");

}
