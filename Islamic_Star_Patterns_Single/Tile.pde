class Tile{
  ArrayList<PVector> vertices = new ArrayList<PVector>();
  ArrayList<Edge> edges = new ArrayList<Edge>();
  
  Tile(){}
  void addVertex(float x, float y){
    PVector pos = new PVector(x, y);
    int total = vertices.size();
    if(total > 0){
      PVector prev = vertices.get(total-1);
      edges.add(new Edge(prev, pos, n));
    }
    vertices.add(pos);
  }
  
  void close(){
    PVector first = vertices.get(0);
    PVector last = vertices.get(vertices.size()-1);
    edges.add(new Edge(last, first, n));
  }
  
  void ray(){
    for(Edge edge : edges){
      edge.ray();
    }
    //for(int i = 0; i < edges.size(); i++){
    //  for(int j = 0; j < edges.size(); j++){
    //    if(i != j){
    //      edges.get(i).findEnds(edges.get(j));
    //    }
    //  }
    //}
  }
  
  void show(){
    for(Edge edge : edges){
      edge.show();
    }
  }
}