void setup(){

  size(700,700);
  background(32,9,9);
  frameRate(60);
}

void draw(){
//a=10, b=5;
//x,y,x+10,y,x+5,y+10;        x,y,x+a,y,x+b,y+a; >>>> x,y,x-a,y,x-b,y-a;
//x,y,x+10,y+5,x,y+10;        x,y,x+a,y+b,x,y+a;
//x,y,x+5,y+10,x-5,y+10;      x,y,x+b,y+a,x-b,y+a;
//x,y,x+2.5,y+10,x-7.5,y+7.5;
/*
  float fact = 2;

  float a = 10*fact;
  float b = 5*fact;

  int x = 100;
  int y = 100;

  triangle(x,y,x+a,y+b,x,y+a);
*/
  TriangleGen tg = new TriangleGen();
  tg.display();

  if(mousePressed == true){

    saveFrame("screenshot.png");

  }
}
