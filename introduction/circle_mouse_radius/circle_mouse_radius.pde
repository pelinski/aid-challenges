void setup() {
  /* setup() es la función de inicialización que se ejecuta una 
  vez al hacer Play en el programa*/
  size(200,200); // window init

}

void draw() {
  /* draw() se ejecuta un número de veces por segundo*/
  background(0);
  circle(100,100,mouseX);

}
