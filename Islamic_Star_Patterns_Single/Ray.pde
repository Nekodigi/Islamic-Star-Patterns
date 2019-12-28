class Ray{
  PVector a;
  PVector v;
  PVector end = null;
  float prevD;
  
  Ray(PVector a, PVector v){
    this.a = a;
    this.v = v;
  }
  
  void show(){
    line(a.x, a.y, end.x, end.y);
  }
  
  void findEnd(Ray target){
    PVector candidate = intersection(a, v, target.a, target.v);
    if(candidate != null){
      float d1 = PVector.dist(candidate, a);
      float d2 = PVector.dist(candidate, target.a);
      float diff = abs(d1 - d2);
      if(diff < 0.001){//symmetry check
        if(end == null || d1 < this.prevD){
          end = candidate;
          prevD = d1;
        }
      }
    }
  }
}