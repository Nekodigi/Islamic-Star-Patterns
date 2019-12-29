Tile ngonAtEdge(float x, float y, float n, float edgeLen, float offset){
  float r = edgeLen/sin(radians(360/n/2))/2;
  return ngonAt(x, y, n, r, offset);
}

Tile ngonAt(float x, float y, float n, float r, float offset){
  Tile tile = new Tile(n);
  for(float i = offset; i < n+offset; i++){
    tile.addVertex(x + cos(i/n*TWO_PI)*r, y + sin(i/n*TWO_PI)*r);
  }
  tile.close();
  return tile;
}

float edge2ins(float r, float n){
  return r/tan(radians(360/n/2))/2;
}