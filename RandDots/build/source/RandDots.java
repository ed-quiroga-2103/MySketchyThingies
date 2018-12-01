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

public class RandDots extends PApplet {

RandBrush brush;

public void setup(){

  
  brush = new RandBrush(width,height);
}

public void draw(){

  brush.display();
  brush.randomize();

  if(mousePressed == true){

    brush.display(mouseX,mouseY);
    brush.randomize();


  }

}
public class List{

   public class Node{

     Node next;
     int x;
     int y;

   }

  Node root = null;
  int length = 0;

  public void addNode(int x, int y){

    if(root==null){

      root = new Node();
      root.x = x; root.y = y;
      this.length++;
    }
    else{

      Node current = root;

      while(root.next != null){

        current = current.next;

      }

      current.next = new Node();

      current.next.x = x; current.next.y = y;
      this.length++;

    }


  }

  public boolean exist(int x, int y){

    Node current = root;

    for(int i = 0; i < this.length; i++){

      if((x-20 < current.x && current.x  < x+20 )&& (y-20 < current.y && current.y  < y+20 )){

        return true;

      }
      else{

        current = current.next;

      }

    }
  return false;
  }

}
public class RandBrush{

  int x;
  int y;
  //Bumblebee - Amber - Peach - Fire - Navajo - Goldenrod
  int colors[] = {color(0xffFCE205), color(0xffFFBF00), color(0xffFFE5B4), color(0xffFDA50F), color(0xffFFDDAF), color(0xffDAA520)};

  int c = colors[(int)random(5)];

  List coords = new List();

  ArrayList<PVector> cooords = new ArrayList();

  RandBrush(int width, int height){

    this.x = (int)random(0,width+1);
    this.y = (int)random(0,height+1);

    coords.addNode(this.x, this.y);

    cooords.add(new PVector(this.x,this.y));


  }

  public void display(){

    fill(this.c);
    stroke(this.c);
    ellipse(this.x , this.y, 4,4);

  }
  public void display(int x, int y){
    if(!cooords.contains(new PVector(x,y))){
    fill(this.c);
    stroke(this.c);
    ellipse(x , y, 4,4);

    cooords.add(new PVector(x,y));
    }
  }

  public void randomize(){

    int x = (int)random(0,width+1);
    int y = (int)random(0,height+1);

    while(cooords.contains(new PVector(x,y))){

      x = (int)random(0,width+1);
      y = (int)random(0,height+1);

    }

    this.x = x;
    this.y = y;

    this.c = colors[(int)random(5)];

    cooords.add(new PVector(this.x,this.y));

  }

}
  public void settings() {  size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "RandDots" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
