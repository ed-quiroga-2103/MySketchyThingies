LineDrawer ld1;
LineDrawer ld2;

void setup(){

  size(700,700);
  ld1 = new LineDrawer(50, width/2-50, 50 ,height-50, 50,0);
  ld1.createPoints();

  ld2 = new LineDrawer(width/2+50, width-50, 50 ,height-50, 50,255);
  ld2.createPoints();

}

void draw(){
  background(0);


  fill(255);
  rect(0,0,700,1400);

  ld1.createLines();
  ld1.display();

  ld2.createLines();
  ld2.display();

  if(mousePressed == true){

    saveFrame("screenshot.png");

  }

}
