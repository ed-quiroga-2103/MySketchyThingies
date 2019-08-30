public class Drop{

  float x;
  float y;
  float rad;

  color colors[] = {color(88,72,128),color(136,80,144),color(248,128,176),color(248,192,216)};

  Drop(float x, float y, float rad){

    this.x = x;
    this.y = y;
    this.rad = rad;

  }

  public void display(int num){

    float fact = this.rad;
    float alpha = 0;
    color c;

    if(num%4 == 0){c = colors[0];}
    else if(num%4 == 1){c = colors[1];}
    else if(num%4 == 2){c = colors[2];}
    else{c = colors[3];}

    while(rad > 0){
      noFill();
      stroke(c,alpha);
      ellipse(this.x,this.y,rad,rad);

      this.rad-=fact/10;
      alpha=-0.36*rad +255;
    }
  }

}
