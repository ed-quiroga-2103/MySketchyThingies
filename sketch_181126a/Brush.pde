public class Brush{

  private float x;
  private float y;
  
  private float prevX;
  
  private int width;
  private int height;
  
  private float rad;
  private float angle;
  
  private boolean goingUp = true;
  private boolean goingRight = true;
  
  private int red = 255;
  private int green = 0;
  private int blue = 0;
  
  private int black = 0;
  
  Brush(int x, int y, int rad, int w, int h, float angle){
    
    this.x = x;
    this.y = y;
    this.rad = rad;
    this.width = w;
    this.height = h;
    this.angle = angle;
    
    this.prevX = x;
    
  }
  
  public void display(){
    fill(this.blue,this.red,this.red);
    stroke(this.blue,this.red,this.red);
    ellipse(this.x, this.y, 40, 40);
    
  }
  
  public void move(){
  
    if(this.goingRight){
    
       if(x == this.width){
         this.goingRight = false;
       }
       x++;
    }
    else{
    
      if(x == 0){
        this.goingRight = true;
      }
      x--;
    }
    
    if(this.goingUp){
    
       if(y == 0){
         this.goingUp =false;
       }
       y--;
    }
    else{
    
      if(y == this.height){
        this.goingUp = true;
      }
      y++;
    }
    
    
  }
  
  public void moveButWithRads(){
    
    float y = sin(angle)*this.rad;
    float x = cos(angle)*this.rad;
    
    this.x = x+this.width/2;
    this.y = y+this.height/2;
    
    this.angle+=10;
    this.rad += 0.5;
    
  }
  
  public void changeColor(){
    /**if(x == this.width/2 && y == this.height/2){
      return;
    }
    
    int reds[] = {0,255,128,0};
    int greens[] = {255,0,0,0};
    int blues[]= {0,0,128,255};
    
    int choosing = (int) random(4);
  
    this.red = reds[choosing];
    this.blue = blues[choosing];
    this.green = greens[choosing];
  */
  
  this.red = (int) this.retColor((int)this.rad);
  
  }
  
  public float retColor(int num){
  
    return (-0.7)*num+255;
    
  }
  
}
