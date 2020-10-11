void setup() {
  size(200,200);
}
void draw() {
  background(0);
  
  if (millis() % 2000 < 1000) {
  circle(width/2, height/2, 50);
  } 
}
