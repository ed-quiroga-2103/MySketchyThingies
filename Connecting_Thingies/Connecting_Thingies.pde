ArrayList<Circle> circles = new ArrayList();

void setup(){

  size(700,700);
  frameRate(60);

}

void draw(){
  background(#59484F);

  while(circles.size()!=25){

    circles.add(new Circle(random(width), random(height), 75));

    for(Circle c : circles){

      c.display();

    }

    if(circles.size()>4){

      for(Circle c : circles){

        c.drawLines(circles);

      }
    }

  }
  //All circles created
  for(Circle c : circles){

    c.display();
    c.drawLines(circles);

  }
  if(mousePressed == true){

    saveFrame("screenshot.png");
    circles = new ArrayList();

  }


}
