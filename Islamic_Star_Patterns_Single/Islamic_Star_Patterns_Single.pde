int n = 4;
float r = 400/2;
float angle = 75;
float delta = 25;
Tile tile = new Tile();
Slider deltaSlider;
Slider angleSlider;

void setup(){
  size(400, 400);
  colorMode(HSB, 360, 100, 100, 100);
  deltaSlider = new Slider(20, height - 40, 0, 200, 25, 1);
  angleSlider = new Slider((width / 2) + 20, height - 40, 0, 90, 75, 1);
  
  for(float i = 0.5; i < n; i++){
    tile.addVertex(cos(i/n*TWO_PI)*r, sin(i/n*TWO_PI)*r);
  }
  tile.close();
}

void draw(){
  background(0);
  angle = angleSlider.value();
  delta = deltaSlider.value();
  angleSlider.show();
  deltaSlider.show();
  translate(width/2, height/2);
  tile.ray();
  stroke(360);
  tile.show();
}