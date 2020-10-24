import processing.video.*;
import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;
String[] movieNames = {"moanin.mov", "kirk.mov", "miles.mov","take.mov"};
Movie[] movies;
boolean[] bPlaying;

void setup() {
  size(640,480);
  frameRate(25);
  movies = new Movie[movieNames.length];
  bPlaying = new boolean[movieNames.length];
  for (int i = 0; i < movieNames.length; i++) {
      movies[i] = new Movie(this, movieNames[i]);
      movies[i].play();
      movies[i].loop();
      movies[i].pause();
  } 
  oscP5 = new OscP5(this,1234);
}

int xadd = 0;
int yadd = 0;


void draw() {  
  background(0,0,0);
  for (int i = 0; i < movieNames.length; i++) {
    if(bPlaying[i]) {
      if(movies[i].available()) movies[i].read();
      image(movies[i],(i%2)*320 + xadd, int(i>1)*240 + yadd);
    }
  }
}

void oscEvent(OscMessage msg) {
 if(msg.checkAddrPattern("/play")==true) { 
      int ivideo = msg.get(0).intValue()-1;
      movies[ivideo].play();
      bPlaying[ivideo] = true;
 }
 if(msg.checkAddrPattern("/stop")==true) { 
      int ivideo = msg.get(0).intValue()-1;
      movies[ivideo].pause();
      bPlaying[ivideo] = false;      
 }
  
}
