public class RandBrush{

  int x;
  int y;
  
  int red;
  int green; 
  int blue;
  
  List coords = new List();
  
  RandBrush(int width, int height){
  
    this.x = (int)random(0,width+1);
    this.y = (int)random(0,height+1);
    
    coords.addNode(this.x, this.y);
    
    
    this.red = (int)random(0,256);
    this.blue = (int)random(0,256);
    this.green = (int)random(0,256);
    
  }
  
  public void display(){
    
    fill(this.red, this.green, this.blue);
    stroke(this.red, this.green, this.blue);
    ellipse(this.x , this.y, 4,4);
  
  }
  
  public void randomize(){
    
    int x = (int)random(0,width+1);
    int y = (int)random(0,height+1);
    
    while(coords.exist(x,y)){
    
      x = (int)random(0,width+1);
      y = (int)random(0,height+1);
      
    }
    
    this.x = x;
    this.y = y;
    
    this.red = (int)random(0,256);
    this.blue = (int)random(0,256);
    this.green = (int)random(0,256);
   
  }
  
}
