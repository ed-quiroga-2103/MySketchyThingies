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

public class Lines_and_Squares_Thingy extends PApplet {

LineDrawer ld1;
LineDrawer ld2;

public void setup(){

  
  ld1 = new LineDrawer(50, width/2-50, 50 ,height-50, 50,0);
  ld1.createPoints();

  ld2 = new LineDrawer(width/2+50, width-50, 50 ,height-50, 50,255);
  ld2.createPoints();

}

public void draw(){
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
public class Line{

  PVector start = new PVector();
  PVector end = new PVector();

  ArrayList<Square> squares = new ArrayList();

  private class Square{

    float x;
    float y;

    float side = 7;

    Square(float x, float y){

      this.x = x;
      this.y = y;
    }

    public void display(float angle){
/*
      translate(700/2, 700/2);
      rotate(angle);
      translate(-700/2, -700/2);
      rectMode(CENTER);

*/
      rectMode(CENTER);
      rect(this.x, this.y,side,side);
      //ellipse(this.x,this.y, 7, 7);

    }

  }

  Line(float x, float y, float a, float b){

    this.start.x = x;
    this.start.y = y;

    this.end.x = a;
    this.end.y = b;

  }

  public void display(){

    line(this.start.x, this.start.y, this.end.x, this.end.y);

  }

  public void createSquares(){

    for(int i = 0; i < 5; i++){

      squares.add(new Square(random(this.start.x, this.end.x), 0));
      squares.get(i).y = this.getPoint(squares.get(i).x);

    }

  }

  public void displaySquares(){

    for(Square s : squares){

      noStroke();
      s.display(getNegAngle());

    }

  }

  public float getPoint(float x){

    float m = (this.start.y - this.end.y)/(this.start.x - this.end.x);

    float b = this.start.y - m*this.start.x;

    float y = m*x+b;

    return y;

  }

  public float getNegAngle(){


    float testX = 1;
    float testY = 0;

    float x = this.end.x - this.start.x;

    float y = this.end.y - this.start.y;

    float angle = acos((testX*x+testY*y)/(sqrt(pow(x,2)+pow(y,2))*sqrt(pow(testX,2)+pow(testY,2))));

    return angle;

  }

}
public class LineDrawer{

  ArrayList<PVector> starts = new ArrayList();
  ArrayList<PVector> ends = new ArrayList();

  ArrayList<Line> lines = new ArrayList();

  PVector lastEnd;

  int x1;
  int x2;

  int y1;
  int y2;


  int numOfLines = 0;

  int colorNum;

  LineDrawer(int x1, int x2, int y1, int y2, int num, int c){

    this.x1 = x1;
    this.x2 = x2;

    this.y1 = y1;
    this.y2 = y2;


    this.numOfLines = num;

    this.colorNum = c;

    lastEnd = new PVector(this.x1, random(this.y1,this.y2));

  }

  public void display(){

    for(Line line : this.lines){
      stroke(this.colorNum);
      line.display();

      fill(this.colorNum);
      line.displaySquares();

    }
  }

  public void createPoints(){

    while(starts.size() != this.numOfLines){

    PVector newStart = new PVector(this.x1, random(this.y1,this.y2));
    PVector newEnd = new PVector(this.x2, random(this.y1,this.y2));

    starts.add(newStart);
    ends.add(newEnd);
    }

    lines.add(new Line(this.x1,this.y1,this.x1,this.y2));

    lines.add(new Line(this.x2,this.y1,this.x2,this.y2));



  }

  public void createLines(){

    if(lines.size() == this.numOfLines){
      return;
    }

    PVector start = starts.get((int)random(starts.size()));
    PVector end = ends.get((int)random(ends.size()));

    lines.add(new Line(start.x, start.y, end.x, end.y));

    ends.remove(end);

    lastEnd = end;

    starts.remove(start);
    ends.remove(end);



    lines.get(lines.size()-1).createSquares();



  }

}
  public void settings() {  size(700,700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Lines_and_Squares_Thingy" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
