public class LineDrawer{

  ArrayList<PVector> starts = new ArrayList();
  ArrayList<PVector> ends = new ArrayList();

  ArrayList<Line> lines = new ArrayList();

  PVector lastEnd;

  int x1;
  int x2;

  int y1;
  int y2;


  int numOfLines = 0;

  int colorNum;

  LineDrawer(int x1, int x2, int y1, int y2, int num, int c){

    this.x1 = x1;
    this.x2 = x2;

    this.y1 = y1;
    this.y2 = y2;


    this.numOfLines = num;

    this.colorNum = c;

    lastEnd = new PVector(this.x1, random(this.y1,this.y2));

  }

  public void display(){

    for(Line line : this.lines){
      stroke(this.colorNum);
      line.display();

      fill(this.colorNum);
      line.displaySquares();

    }
  }

  public void createPoints(){

    while(starts.size() != this.numOfLines){

    PVector newStart = new PVector(this.x1, random(this.y1,this.y2));
    PVector newEnd = new PVector(this.x2, random(this.y1,this.y2));

    starts.add(newStart);
    ends.add(newEnd);
    }

    lines.add(new Line(this.x1,this.y1,this.x1,this.y2));

    lines.add(new Line(this.x2,this.y1,this.x2,this.y2));



  }

  public void createLines(){

    if(lines.size() == this.numOfLines){
      return;
    }

    PVector start = starts.get((int)random(starts.size()));
    PVector end = ends.get((int)random(ends.size()));

    lines.add(new Line(start.x, start.y, end.x, end.y));

    ends.remove(end);

    lastEnd = end;

    starts.remove(start);
    ends.remove(end);



    lines.get(lines.size()-1).createSquares();



  }

}
