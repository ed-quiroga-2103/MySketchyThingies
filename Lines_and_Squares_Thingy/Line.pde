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
