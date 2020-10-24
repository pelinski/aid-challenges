import oscP5.*;
import netP5.*;
  
OscP5 oscP5;
NetAddress myRemoteLocation;

void setup() {
  size(200,200);
  frameRate(25);
  oscP5 = new OscP5(this,12345);
  myRemoteLocation = new NetAddress("127.0.0.1",1234);
}

void sendMsgInt(String addr, int v) {
  OscMessage myMessage = new OscMessage(addr);
  myMessage.add(v); 
  oscP5.send(myMessage, myRemoteLocation); 
}


void keyPressed() {
  if (key == '1') sendMsgInt("/play",1);
  if (key == 'q') sendMsgInt("/stop",1);    
  if (key == '2') sendMsgInt("/play",2);
  if (key == 'w') sendMsgInt("/stop",2);    
  if (key == '3') sendMsgInt("/play",3);
  if (key == 'e') sendMsgInt("/stop",3);    
  if (key == '4') sendMsgInt("/play",4);
  if (key == 'r') sendMsgInt("/stop",4);      
}

void draw() {  
  background(0,0,0);
}


void mouseClicked() {
}
