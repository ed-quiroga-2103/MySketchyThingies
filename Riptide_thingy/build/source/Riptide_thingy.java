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

public class Riptide_thingy extends PApplet {

int count = 0;
public void setup(){

  
  frameRate(30);
  background(32,48,96);
}

/*



*/

public void draw(){
  /*
  if(mousePressed == true){
    saveFrame("screenshot.png");
    count = 0;
    background(89,103,132);
  }*/



}
public void mouseClicked(){
  int x = mouseX;
  int y = mouseY;
  new Drop(x,y,700).display(count);
  count++;

}

public void keyPressed(){

    saveFrame("screenshot.png");

}
public class Drop{

  float x;
  float y;
  float rad;

  int colors[] = {color(88,72,128),color(136,80,144),color(248,128,176),color(248,192,216)};

  Drop(float x, float y, float rad){

    this.x = x;
    this.y = y;
    this.rad = rad;

  }

  public void display(int num){

    float fact = this.rad;
    float alpha = 0;
    int c;

    if(num%4 == 0){c = colors[0];}
    else if(num%4 == 1){c = colors[1];}
    else if(num%4 == 2){c = colors[2];}
    else{c = colors[3];}

    while(rad > 0){
      noFill();
      stroke(c,alpha);
      ellipse(this.x,this.y,rad,rad);

      this.rad-=fact/10;
      alpha=-0.36f*rad +255;
    }
  }

}
  public void settings() {  size(700,700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Riptide_thingy" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
