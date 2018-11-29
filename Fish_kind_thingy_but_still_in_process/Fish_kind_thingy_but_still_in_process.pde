Thingy th;

void setup(){
  
  size(800,600);
  
  th = new Thingy(width,height);

}

void draw(){

  background(0);
  th.display();
  th.randomMove(mouseX, mouseY);
  

}
