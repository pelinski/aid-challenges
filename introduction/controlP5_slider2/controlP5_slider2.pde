// import and declare controlP5 lib
import controlP5.* ;
ControlP5 controlP5;

int myColor = color(0,0,0);
int slider1 = 100;
int slider2 = 200;

void setup() {
  size(400,400);
  controlP5 = new ControlP5(this);
  // controlP5.addSlider("slider1", minVal,maxVal,startVal,posX,posY,width,height) ;
  controlP5.addSlider("slider1", 0,350,128,20,50,10,100) ;
  controlP5.addSlider("slider2", 0,350,128,40,50,10,100) ;

}

void draw() {
  background(0);
  rect(slider1, slider2, 50, 50);

}
