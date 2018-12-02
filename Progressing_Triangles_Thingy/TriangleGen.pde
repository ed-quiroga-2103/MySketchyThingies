public class TriangleGen{

  int a = 10;
  int b = 5;
  float c = 7.5;
  float d = 2.5;

  color colors[] = {color(50,52,42), color(#322523),color(32,36,44), color(#CF3B30), color(107,32,31)};

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

        this.vertexB.x = x1+2.5*pow(-1,(int)random(1,3));
        this.vertexB.y = y1+10*pow(-1,(int)random(1,3));
        this.vertexC.x = x1+7.5*pow(-1,(int)random(1,3));
        this.vertexC.y = y1+7.5*pow(-1,(int)random(1,3));

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
