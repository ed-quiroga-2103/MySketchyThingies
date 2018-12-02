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

public class Progressing_Triangles_Thingy extends PApplet {

public void setup(){

  
  background(32,9,9);
  frameRate(60);
}

public void draw(){
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
public class TriangleGen{

  int a = 10;
  int b = 5;
  float c = 7.5f;
  float d = 2.5f;

  int colors[] = {color(50,52,42), color(0xff322523),color(32,36,44), color(0xffCF3B30), color(107,32,31)};

  private class Triangle{

    PVector vertexA = new PVector();    //          / \ A
    PVector vertexB = new PVector();    //         /   \      im really sorry for my awful representation
    PVector vertexC = new PVector();    //      C /_____\ B

    Triangle(float x1,float y1, int type){

      this.vertexA.x = x1;
      this.vertexA.y = y1;

      if(type == 0 ){

        this.vertexB.x = x1+10*pow(-1,(int)random(1,3));
        this.vertexB.y = y1+5*pow(-1,(int)random(1,3));
        this.vertexC.x = x1;
        this.vertexC.y = y1+10*pow(-1,(int)random(1,3));

      }
      else if(type == 1){

        this.vertexB.x = x1+10*pow(-1,(int)random(1,3));
        this.vertexB.y = y1;
        this.vertexC.x = x1+5*pow(-1,(int)random(1,3));
        this.vertexC.y = y1+10*pow(-1,(int)random(1,3));


      }
      else if(type == 2){

        this.vertexB.x = x1+5*pow(-1,(int)random(1,3));
        this.vertexB.y = y1+10*pow(-1,(int)random(1,3));
        this.vertexC.x = x1+5*pow(-1,(int)random(1,3));
        this.vertexC.y = y1+10*pow(-1,(int)random(1,3));

      }
      else{

        this.vertexB.x = x1+2.5f*pow(-1,(int)random(1,3));
        this.vertexB.y = y1+10*pow(-1,(int)random(1,3));
        this.vertexC.x = x1+7.5f*pow(-1,(int)random(1,3));
        this.vertexC.y = y1+7.5f*pow(-1,(int)random(1,3));

      }

    }

    public void display(){

      triangle(this.vertexA.x,this.vertexA.y,this.vertexB.x,this.vertexB.y,this.vertexC.x,this.vertexC.y);

    }

  }


  public void display(){

    noStroke();
    fill(colors[(int)random(5)]);
    new Triangle(random(width),random(height),(int)random(0,4)).display();

  }

}
  public void settings() {  size(700,700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Progressing_Triangles_Thingy" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
