public class Thingy{

  float x;
  float y;
  
  int velX = 0;
  int velY = 0;
  
  float accX = 0.9;
  float accY = 0.9;
  
  int height;
  int width;
  
   int moveToX = 0;
   int moveToY = 0;
  

  Thingy(int width, int height){
  
    this.x = (int)random(width+1);
    this.y = (int)random(height+1);
    
    this.moveToX = (int)random(this.width);
    this.moveToY = (int)random(this.height);
    
    this.height = height;
    this.width = width;
  }
  
  public void randomMove(int a, int b){
   /* 
    if(this.x == this.moveToX && this.y == this.moveToY){
    
      this.moveToX = (int)random(this.width);
      this.moveToY = (int)random(this.height);
      
    }
   */
    
    this.moveToX = a;
    
    this.moveToY = b;
    
      //Straight
      float move1 = sqrt(pow((this.x-moveToX),2)+pow((this.y-1-moveToY),2));
      float move2 = sqrt(pow((this.x-moveToX),2)+pow((this.y+1-moveToY),2));
      float move3 = sqrt(pow((this.x+1-moveToX),2)+pow((this.y-moveToY),2));
      float move4 = sqrt(pow((this.x-1-moveToX),2)+pow((this.y-moveToY),2));
     
      //Diagonal
      float move5 = sqrt(pow((this.x+1-moveToX),2)+pow((this.y-1-moveToY),2));
      float move6 = sqrt(pow((this.x+1-moveToX),2)+pow((this.y+1-moveToY),2));
      float move7 = sqrt(pow((this.x-1-moveToX),2)+pow((this.y+1-moveToY),2));
      float move8 = sqrt(pow((this.x-1-moveToX),2)+pow((this.y-1-moveToY),2));
      
      float moves[] = {move1,move2,move3,move4,move5,move6,move7,move8};
      
      float lowest = getLowest(moves);
      print(lowest);
      print("\n");
      
      //velocity = vel += acc
  //Movement = position += vel + friction*acceleration
      if(lowest == move1){
        
        this.velY += this.accY;
        this.y -= this.velY + 0.5*this.accY;
        
      }
      else if(lowest == move2){
        
        this.velY += this.accY;
        this.y += this.velY + 0.5*this.accY;
        
      }
      else if(lowest == move3){
        
        this.velX += this.accX;
        this.x += this.velX + 0.5*this.accX;
      
      }
      else if(lowest == move4){
      
        this.velX += this.accX;
        this.x -= this.velX + 0.5*this.accX;
        
      }
      else if(lowest == move5){
      
        this.velY += this.accY;
        this.y -= this.velY + 0.5*this.accY;
        this.velX += this.accX;
        this.x += this.velX + 0.5*this.accX;
        
      }
      else if(lowest == move6){
        
        this.velY += this.accY;
        this.y += this.velY + 0.5*this.accY;
        this.velX += this.accX;
        this.x += this.velX + 0.5*this.accX;
        
      }
      else if(lowest == move7){
        
        this.velY += this.accY;
        this.y += this.velY + 0.5*this.accY;
        this.velX += this.accX;
        this.x -= this.velX + 0.5*this.accX;
      
      }
      else{
      
        this.velY += this.accY;
        this.y -= this.velY + 0.5*this.accY;
        this.velX += this.accX;
        this.x -= this.velX + 0.5*this.accX;
        
      
   }
  }
  
  public void display(){
  
    ellipse((int)this.x, (int)this.y, 40,40);
  
  }
  
  public float getLowest(float moves[]){
  
    float lowest = moves[0];
    
    for(int i = 0; i < 8; i++){
    
      if(moves[i] < lowest){
      
        lowest = moves[i];
      
      }
      
    }
    
    return lowest;
  
  }



}
