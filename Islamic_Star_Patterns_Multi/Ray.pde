class Ray{
  PVector a;
  PVector v;
  PVector end = null;
  float prevD;
  
  Ray(PVector a, PVector v){
    this.a = a;
    this.v = v;
    end = PVector.add(a, v);
  }
  
  void show(){
    line(a.x, a.y, end.x, end.y);
  }
}