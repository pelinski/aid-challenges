boolean showCircle = true;

void setup() {
size(200,200);
}
void draw() {
  background(0);
if (showCircle) circle(width/2, height/2, 50);
}

void mouseClicked() {
showCircle = !showCircle;}
