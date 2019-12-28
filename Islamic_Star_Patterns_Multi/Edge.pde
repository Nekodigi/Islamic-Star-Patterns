class Edge{
  PVector a, b;
  Ray r1, r2 = null;
  
  Edge(PVector a, PVector b){
    this.a = a;
    this.b = b;
  }
  
  void ray(){
    PVector mid = PVector.add(a, b).mult(0.5);
    PVector v1 = PVector.sub(a, mid);
    PVector v2 = PVector.sub(b, mid);
    PVector offset1 = mid.copy();
    PVector offset2 = mid.copy();
    if(delta > 0){
      v1.setMag(delta/2);
      v2.setMag(delta/2);
      offset1.add(v2);
      offset2.add(v1);
    }
    //v1.normalize();//isn't need ?
    //v2.normalize();
    v1.rotate(radians(-angle));
    v2.rotate(radians(angle));
    r1 = new Ray(offset1, v1);
    r2 = new Ray(offset2, v2);
  }
  
  void show(){
    //line(a.x, a.y, b.x, b.y);
    r1.show();
    r2.show();
  }
  
  void findEnds(Edge edge){
    r1.findEnd(edge.r1);
    r1.findEnd(edge.r2);
    r2.findEnd(edge.r1);
    r2.findEnd(edge.r2);
  }
}