LineDrawer lineDrawer;

color b1, b2, c1, c2;
void setup(){

  size(700,700);
  lineDrawer = new LineDrawer(width, height, 150);
  lineDrawer.createPoints();

  c1 = color(#E5FCC2);
  c2 = color(#45ADA8);
  frameRate(60);
}
void draw(){

  // Background
  setGradient(0, 0, width, height, c1, c2, 2);

  lineDrawer.createLines();
  lineDrawer.display();

  if(mousePressed == true){

    saveFrame("screenshot.png");

  }

}
//Not mine lmao, but everything else is
void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == 2) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
  else if (axis == 1) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
