public class List{

   public class Node{

     Node next;
     int x;
     int y;

   }

  Node root = null;
  int length = 0;

  public void addNode(int x, int y){

    if(root==null){

      root = new Node();
      root.x = x; root.y = y;
      this.length++;
    }
    else{

      Node current = root;

      while(root.next != null){

        current = current.next;

      }

      current.next = new Node();

      current.next.x = x; current.next.y = y;
      this.length++;

    }


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

}
