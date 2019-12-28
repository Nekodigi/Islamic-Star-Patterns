PVector intersection(PVector p1, PVector v1, PVector p2, PVector v2){
  float t1 = v2.y*v1.x - v2.x*v1.y;
  float ta = v2.x*(p1.y-p2.y) - v2.y*(p1.x-p2.x);
  float tb = v1.x*(p1.y-p2.y) - v1.y*(p1.x-p2.x);
  float ua = ta/t1;
  float ub = tb/t1;
  float x = p1.x + ua*v1.x;
  float y = p1.y + ua*v1.y;//spacial case
  if (ua > 0 && ub > 0 && t1 != 0.0) {
    return new PVector(x, y);
  }
  return null;
}
 