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

public class Connecting_Thingies extends PApplet {

ArrayList<Circle> circles = new ArrayList();

public void setup(){

  
  frameRate(60);

}

public void draw(){
  background(0xff59484F);

  while(circles.size()!=25){

    circles.add(new Circle(random(width), random(height), 75));

    for(Circle c : circles){

      c.display();

    }

    if(circles.size()>4){

      for(Circle c : circles){

        c.drawLines(circles);

      }
    }

  }
  //All circles created
  for(Circle c : circles){

    c.display();
    c.drawLines(circles);

  }
  if(mousePressed == true){

    saveFrame("screenshot.png");
    circles = new ArrayList();

  }


}
public class Circle{

  float x;
  float y;

  float diam;

  int colors[] = {color(109,118,150), color(69,92,79), color(204,85,67), color(237,181,121), color(0xffDBE6AF)};

  int c = colors[(int)random(5)];

  Circle c1 = null;
  Circle c2 = null;

  boolean assigned = false;

  ArrayList<Circle> lines = new ArrayList();

  Circle(float x, float y, float diam){

    this.x = x;
    this.y = y;
    this.diam = diam;

  }

  public void display(){

    this.step();

    stroke(c);
    fill(c,125);
    ellipse(this.x,this.y,this.diam,this.diam);

  }

  public void drawLines(ArrayList<Circle> circles){
    if(!this.assigned){
    int a = (int)random(circles.size());
    int b = (int)random(circles.size());

    while(a == b){

      b = (int)random(circles.size());

    }

    this.c1 = circles.get(a);
    this.c2 = circles.get(b);

    stroke(0);

    line(this.x,this.y,this.c1.x,this.c1.y);

    line(this.x,this.y,this.c2.x,this.c2.y);

    this.assigned = true;
    }
    else{


      stroke(0);

      line(this.x,this.y,this.c1.x,this.c1.y);

      line(this.x,this.y,this.c2.x,this.c2.y);

    }
  }

  public void step(){

    if(this.x >= width){

      this.x -= 1;

    }
    else if(this.x <= 0){

      this.x += 1;

    }
    else{

      this.x += 1*(pow(-1,(int)random(1,3)));

    }

    if(this.y >= height){

      this.y -=1;

    }
    else if(this.y <= 0){

      this.y += 1;

    }
    else{

      this.y += 1*(pow(-1,(int)random(1,3)));

    }

  }

}
  public void settings() {  size(700,700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Connecting_Thingies" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
