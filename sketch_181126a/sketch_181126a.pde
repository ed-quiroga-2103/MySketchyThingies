Brush brush;
void setup(){

  size(500,500);
  background(0);
  
  brush = new Brush(width/2, height/2, 0, width, height, PI);

}

void draw(){  
  brush.display();
  brush.moveButWithRads();
  brush.changeColor();
}
