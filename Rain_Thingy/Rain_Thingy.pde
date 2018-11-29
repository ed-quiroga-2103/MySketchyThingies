ArrayList<List> rain = new ArrayList();

void setup(){

  size(1000,600);

}

void draw(){

  background(#547980);
  if(rain.size() < 25){
  rain.add(new List());
  }

  ArrayList<Integer> deletes = new ArrayList();

  for(List list : rain){

    list.addNode();

    list.display();

    if(list.getNode(list.length-1).alpha <= 0){deletes.add(rain.indexOf(list));}


  }

  for(int i : deletes){

    rain.remove(i);

  }


  int  idletime=millis()+1000/144;    //wait for 1 second
  while(idletime>millis())
  {}

}
