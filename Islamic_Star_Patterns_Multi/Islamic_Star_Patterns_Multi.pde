float level = 0;
float w = 30;
float angle = 75;
float delta = 10;
ArrayList<Tile> tiles = new ArrayList<Tile>();
Slider deltaSlider;
Slider angleSlider;
Slider levelSlider;
int cols, rows;

void setup(){
  size(800, 800);
  //fullScreen();
  colorMode(HSB, 360, 100, 100, 100);
  deltaSlider = new Slider(20, height - 40, 0, w-0.1, 0, 1);
  angleSlider = new Slider((width / 3) + 20, height - 40, 0, 90, 60, 1);
  levelSlider = new Slider((width / 3*2) + 20, height - 40, 0, 10, 0, 1);
  print(degrees(asin(1/sqrt(2))));
  float temp = w/2+edge2ins(w, 8);
  cols = ceil((float)width / temp / 2)+1;
  rows = ceil((float)height / temp )+1;
  for(int j = 0; j < rows; j++){
    for(int i = 0; i < cols; i++){
      tiles.add(ngonAtEdge(temp*(2*i+(j)%2), temp*j, 4, w, 0.5));
      tiles.add(ngonAtEdge(temp*(2*i+(j+1)%2), temp*j, 8, w, 0.5));
    }
  }
}

void draw(){
  background(0);
  angle = angleSlider.value();
  delta = deltaSlider.value();
  level = levelSlider.value();
  angleSlider.show();
  deltaSlider.show();
  levelSlider.show();
  for(Tile tile : tiles){
    tile.ray();
    stroke(360);
    tile.show();
  }
}