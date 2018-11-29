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

public class Rain_Thingy extends PApplet {

ArrayList<List> rain = new ArrayList();

public void setup(){

  

}

public void draw(){

  background(0xff547980);
  if(rain.size() < 25){
  rain.add(new List());
  }

  ArrayList<Integer> deletes = new ArrayList();

  for(List list : rain){

    list.addNode();

    list.display();

    if(list.getNode(list.length-1).alpha <= 0){deletes.add(rain.indexOf(list));}


  }

  for(int i : deletes){

    rain.remove(i);

  }


  int  idletime=millis()+1000/144;    //wait for 1 second
  while(idletime>millis())
  {}

}
public class List{

   public class Node{

     Node next;
     Node prev;
     int x;
     int y;
     int alpha = 255;

     int diam;

     Node(int diam, int x){

       this.diam = diam;
       this.x = x;
       this.y = -1*diam/2;

     }

     public void display(){
       noStroke();
       fill(0xffE5FCC2, alpha);
       ellipse(this.x, this.y, diam,diam);

     }


   }

  Node root;
  int length = 0;
  int diam = ((int)random(5,15));
  int x = (int)random(1001);

  boolean addMore = true;

  public void addNode(){

    if(this.addMore){

      if(root==null){

        root = new Node(this.diam, this.x);

        this.length++;
      }
      else{

        Node current = root;

        while(current.next != null){

          current = current.next;

        }

        current.next = new Node(this.diam, this.x);
        current.next.prev = current;
        current.next.y = current.y+this.diam/3;

        if(current.next.y > 600){

          this.addMore = false;

        }

        this.length++;



      }

    }

  }
  public void display(){

    for(int i = 0; i < this.length; i++){

      if(this.getNode(i).alpha > 0){

      this.getNode(i).display();
      }
    }
    for(int i = 0; i < this.length; i++){

        this.getNode(i).alpha-=2;

    }

  }

  public Node getNode(int ind){

    Node current = root;

    for(int i = 0; i < ind; i++){

      current = current.next;

    }

    return current;

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
  public void reset(){

    this.root = null;

  }

}
  public void settings() {  size(1000,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Rain_Thingy" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
