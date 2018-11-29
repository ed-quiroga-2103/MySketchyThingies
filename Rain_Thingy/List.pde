public class List{

   public class Node{

     Node next;
     Node prev;
     int x;
     int y;
     int alpha = 255;

     int diam;

     Node(int diam, int x){

       this.diam = diam;
       this.x = x;
       this.y = -1*diam/2;

     }

     public void display(){
       noStroke();
       fill(#E5FCC2, alpha);
       ellipse(this.x, this.y, diam,diam);

     }


   }

  Node root;
  int length = 0;
  int diam = ((int)random(5,15));
  int x = (int)random(1001);

  boolean addMore = true;

  public void addNode(){

    if(this.addMore){

      if(root==null){

        root = new Node(this.diam, this.x);

        this.length++;
      }
      else{

        Node current = root;

        while(current.next != null){

          current = current.next;

        }

        current.next = new Node(this.diam, this.x);
        current.next.prev = current;
        current.next.y = current.y+this.diam/3;

        if(current.next.y > 600){

          this.addMore = false;

        }

        this.length++;



      }

    }

  }
  public void display(){

    for(int i = 0; i < this.length; i++){

      if(this.getNode(i).alpha > 0){

      this.getNode(i).display();
      }
    }
    for(int i = 0; i < this.length; i++){

        this.getNode(i).alpha-=2;

    }

  }

  public Node getNode(int ind){

    Node current = root;

    for(int i = 0; i < ind; i++){

      current = current.next;

    }

    return current;

  }

  public boolean exist(int x, int y){

    Node current = root;

    for(int i = 0; i < this.length; i++){

      if((x-20 < current.x && current.x  < x+20 )&& (y-20 < current.y && current.y  < y+20 )){

        return true;

      }
      else{

        current = current.next;

      }

    }
  return false;
  }
  public void reset(){

    this.root = null;

  }

}
