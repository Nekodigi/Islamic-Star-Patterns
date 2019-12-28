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

Tile ngonAtEdge(float x, float y, float n, float edgeLen, float offset){
  float r = edgeLen/sin(radians(360/n/2))/2;
  return ngonAt(x, y, n, r, offset);
}

Tile ngonAt(float x, float y, float n, float r, float offset){
  Tile tile = new Tile();
  for(float i = offset; i < n+offset; i++){
    tile.addVertex(x + cos(i/n*TWO_PI)*r, y + sin(i/n*TWO_PI)*r);
  }
  tile.close();
  return tile;
}

float edge2ins(float r, float n){
  return r/tan(radians(360/n/2))/2;
}