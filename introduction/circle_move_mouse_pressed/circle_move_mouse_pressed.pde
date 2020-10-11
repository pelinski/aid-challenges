//Make the circle move only when mouse is clicked and stay there when unclicked
float mX, mY;
int radius = 50;

void setup() {
  size(200,200);
}

void draw() {
  background(0);
  if (mousePressed) { 
    mX = mouseX;
    mY = mouseY;
  }
  circle(mX, mY, radius);
}
