RandBrush brush;

void setup(){

  size(500,500);
  brush = new RandBrush(width,height);
}

void draw(){

  brush.display();
  brush.randomize();

  if(mousePressed == true){

    brush.display(mouseX,mouseY);
    brush.randomize();


  }

}
