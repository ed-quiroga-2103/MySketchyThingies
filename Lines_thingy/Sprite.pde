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
