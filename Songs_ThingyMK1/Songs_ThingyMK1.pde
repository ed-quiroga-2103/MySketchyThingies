import processing.sound.*;

FFT fft;
int bands = 1024;
AudioIn in;
Amplitude vol;
float maxR = 0;
float maxx = 0;
float[] spectrum = new float[bands];

float xC;
float yC;



void setup() {
  size(720, 640);
  frameRate(360);
  // Create an Input stream which is routed into the Amplitude analyzer
  fft = new FFT(this, bands);
  vol =  new Amplitude(this);
  // start the Audio Input
  //SoundFile song = new SoundFile(this, "JojiSong.mp3");
  
  // patch the AudioIn
  in = new AudioIn(this, 0);
  fft.input(in);
  vol.input(in);
  //song.play();
  background(0);
  xC = width/2;
  yC = height/2;


}      

void draw() {

  fft.analyze(spectrum);
  PShape path;
  PShape path2;
  path = createShape();
  path.beginShape();
  // Set fill and stroke 
  path.strokeWeight(3);
  
  
  // Set fill and stroke 
  
  float x = 0;
  float y = 0;
  float r = 0;
  float nextR = map(vol.analyze(),0,1,0,750);
 
  
  
  if(nextR > maxR){
    maxR = nextR;
  }
  else{
    maxR-=2;
    
  }
  
  if(maxx < maxR){
    maxx = maxR;
  }
  
  
  r = maxR;

  
  float a = 0;
  x = r*cos(a); y = r*sin(a);
  path.vertex(x,y);
  
  if(r <75){
  background(0);
  
}  

  
  
  
  // Calculate the path as a sine wave
  for (int i = 0; i < bands; i++) {
    colorMode(HSB, 255);
    fill(0,10);
    
    stroke(map(max(spectrum), 0, 1, 0, 255),255,map(vol.analyze(),0,1,100,255), map(vol.analyze(),0,1,200,100));
    
    
    a+=TWO_PI/bands;
    
    float amp = 0;
    if(a> 3*PI/4){
         amp = 50;
    }
    else if(a > PI/6){
    amp = map(i,0,bands,2,7);
    }
    else { amp = map(i, 0, bands, 1, 2);}
    
    if(spectrum[1] < 0.5 && i > 3*bands/4){amp = 1;}
    if(i > 3*bands/4){
      spectrum[i]*=100;
    }
    x = r*cos(a) + spectrum[i]*r*cos(a)*amp;
    y = r*sin(a) + spectrum[i]*r*sin(a)*amp;
    path.vertex(x,y);
    
    
  }
  translate(xC, yC);

  shape(path);

  x = 0;
  y = 0;
  a = 0;
  x = r*cos(a); y = r*sin(a);
  path.vertex(x,y);
  // The path is complete
  path.endShape();  

 

}
