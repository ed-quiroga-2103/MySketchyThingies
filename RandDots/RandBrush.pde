public class RandBrush{

  int x;
  int y;
  //Bumblebee - Amber - Peach - Fire - Navajo - Goldenrod
  color colors[] = {color(#FCE205), color(#FFBF00), color(#FFE5B4), color(#FDA50F), color(#FFDDAF), color(#DAA520)};

  color c = colors[(int)random(5)];

  List coords = new List();

  //Hot-fix for List errors. Gotta fix those but class ArrayList works
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
