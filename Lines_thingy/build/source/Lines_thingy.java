import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Lines_thingy extends PApplet {

LineDrawer lineDrawer;

int b1, b2, c1, c2;
public void setup(){

  
  lineDrawer = new LineDrawer(width, height, 150);
  lineDrawer.createPoints();

  c1 = color(0xffE5FCC2);
  c2 = color(0xff45ADA8);
  frameRate(60);
}
public void draw(){

  // Background
  setGradient(0, 0, width, height, c1, c2, 2);

  lineDrawer.createLines();
  lineDrawer.display();

  if(mousePressed == true){

    saveFrame("screenshot.png");

  }

}
//Not mine lmao, but everything else is
public void setGradient(int x, int y, float w, float h, int c1, int c2, int axis ) {

  noFill();

  if (axis == 2) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      int c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }
  else if (axis == 1) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      int c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
public class LineDrawer{

  ArrayList<PVector> starts = new ArrayList();
  ArrayList<PVector> ends = new ArrayList();

  ArrayList<Line> lines = new ArrayList();

  PVector lastEnd;

  int width;
  int height;


  int numOfLines = 0;

  LineDrawer(int w, int h, int num){

    this.width = w;
    this.height = h;

    this.numOfLines = num;

    lastEnd = new PVector(random(25,this.width-25), random(25,this.height-25));

  }

  public void display(){

    for(Line line : this.lines){
      stroke(0xffFE4365);
      line.display();

    }
  }

  public void createPoints(){

    while(starts.size() != this.numOfLines){

    PVector newStart = new PVector(random(25,this.width-25), random(25,this.height-25));
    PVector newEnd = new PVector(random(25,this.width-25), random(25,this.height-25));

    starts.add(newStart);
    ends.add(newEnd);
    }
  }

  public void createLines(){

    if(lines.size() == -1*this.numOfLines){
      return;
    }

    PVector start = lastEnd;//starts.get((int)random(starts.size()));
    PVector end = ends.get((int)random(ends.size()));

    lines.add(new Line(start.x, start.y, end.x, end.y));

    ends.remove(end);

    lastEnd = end;

    starts.remove(start);
    ends.remove(end);

    starts.add(end);
    ends.add(start);

  }

}
public class Line{

  PVector start = new PVector();
  PVector end = new PVector();
  
  Line(float x, float y, float a, float b){
  
    this.start.x = x;
    this.start.y = y;
    
    this.end.x = a;
    this.end.y = b;
    
  }
  
  public void display(){
  
    line(this.start.x, this.start.y, this.end.x, this.end.y);
  
  }

}
  public void settings() {  size(700,700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Lines_thingy" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
