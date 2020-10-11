boolean show = true;

void setup() {
size(200,200);

}

void draw() {
 background(0);
 if (show) {
  circle(width/2,height/2, 50);
 }  
  delay(1000);
  show = !show;
  
}
