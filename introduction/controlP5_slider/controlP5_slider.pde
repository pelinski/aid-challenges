// import and declare controlP5 lib
import controlP5.* ;
ControlP5 controlP5;

int myColor = color(0,0,0);
int slider = 100;

void setup() {
  size(400,400);
  controlP5 = new ControlP5(this);
  controlP5.addSlider("slider", 0,350,128,20,100,10,100) ;
}

void draw() {
  background(0);
  rect(slider, 0, 50, 50);
}
