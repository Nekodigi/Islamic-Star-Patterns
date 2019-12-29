class Edge{
  PVector a, b;
  Ray r1, r2 = null;
  float n;
  
  Edge(PVector a, PVector b, float n){
    this.a = a;
    this.b = b;
    this.n = n;
  }
  
  void ray(){
    PVector mid = PVector.add(a, b).mult(0.5);
    PVector v1 = PVector.sub(a, mid);
    PVector v2 = PVector.sub(b, mid);
    PVector offset1 = mid.copy();
    PVector offset2 = mid.copy();
    float half_len = v1.mag();
    float elen = half_len + delta;
    if(delta > 0){
      v1.setMag(delta/2);
      v2.setMag(delta/2);
      offset1.add(v2);
      offset2.add(v1);
    }
    v1.rotate(radians(-angle));
    v2.rotate(radians(angle));
    float interior = (n - 2) * PI / n;
    // Law of sines right here!
    float alpha = interior * 0.5;
    float beta = PI - radians(angle) - alpha;
    float len = (elen* sin(alpha)) / sin(beta);
    
    float theta = PI/n;
    float Re=half_len/sin(PI/n);
    float len2 = sin(theta * level) * (Re - (len*sin(radians(angle))/sin(alpha)))/sin(beta+(theta * level));
    len = len + len2;
    v1.setMag(len);
    v2.setMag(len);
    r1 = new Ray(offset1, v1);
    r2 = new Ray(offset2, v2);
  }
  
  void show(){
    //line(a.x, a.y, b.x, b.y);
    r1.show();
    r2.show();
  }
  
}