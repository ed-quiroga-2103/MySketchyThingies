public class LineDrawer{

  ArrayList<PVector> starts = new ArrayList();
  ArrayList<PVector> ends = new ArrayList();

  ArrayList<Line> lines = new ArrayList();

  PVector lastEnd;

  int width;
  int height;


  int numOfLines = 0;

  LineDrawer(int w, int h, int num){

    this.width = w;
    this.height = h;

    this.numOfLines = num;

    lastEnd = new PVector(random(25,this.width-25), random(25,this.height-25));

  }

  public void display(){

    for(Line line : this.lines){
      stroke(#FE4365);
      line.display();

    }
  }

  public void createPoints(){

    while(starts.size() != this.numOfLines){

    PVector newStart = new PVector(random(25,this.width-25), random(25,this.height-25));
    PVector newEnd = new PVector(random(25,this.width-25), random(25,this.height-25));

    starts.add(newStart);
    ends.add(newEnd);
    }
  }

  public void createLines(){

    if(lines.size() == -1*this.numOfLines){
      return;
    }

    PVector start = lastEnd;//starts.get((int)random(starts.size()));
    PVector end = ends.get((int)random(ends.size()));

    lines.add(new Line(start.x, start.y, end.x, end.y));

    ends.remove(end);

    lastEnd = end;

    starts.remove(start);
    ends.remove(end);

    starts.add(end);
    ends.add(start);

  }

}
