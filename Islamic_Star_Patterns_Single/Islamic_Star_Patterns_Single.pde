int n = 4;
float level = 0;
float elen = 400;
float angle = 75;
float delta = 25;
Tile tile = new Tile();
Slider deltaSlider;
Slider angleSlider;
Slider levelSlider;

void setup(){
  size(400, 400);
  colorMode(HSB, 360, 100, 100, 100);
  deltaSlider = new Slider(20, height - 40, 0, 200, 25, 1);
  angleSlider = new Slider((width / 3) + 20, height - 40, 0, 90, 75, 1);
  levelSlider = new Slider((width / 3*2) + 20, height - 40, 0, 4, 0, 1);
  
  for(float i = 0.5; i < n; i++){
    tile.addVertex(cos(i/n*TWO_PI)*elen*sqrt(2)/2, sin(i/n*TWO_PI)*elen*sqrt(2)/2);
  }
  tile.close();
}

void draw(){
  background(0);
  angle = angleSlider.value();
  delta = deltaSlider.value();
  level = levelSlider.value();
  angleSlider.show();
  deltaSlider.show();
  levelSlider.show();
  translate(width/2, height/2);
  tile.ray();
  stroke(360);
  tile.show();
}