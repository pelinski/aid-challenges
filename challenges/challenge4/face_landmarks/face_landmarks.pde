// Copyright (C) 2018 Runway AI Examples
//
// This file is part of Runway AI Examples.
//
// Runway-Examples is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Runway-Examples is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with RunwayML.  If not, see <http://www.gnu.org/licenses/>.
//
// ===========================================================================

// RUNWAY
// www.runwayapp.ai

// face_landmarks Demo:
// Receive OSC messages from Runway
// Running face_landmarks model
// original example by Joel Matthys @jwmatthys, adapted by George Profenza
// edited by Teresa Pelinski to send OSC messages to wekinator
// import OSC library
import oscP5.*;
import netP5.*;
// import Runway library
import com.runwayml.*;
// reference to runway instance
RunwayOSC runway;

OscP5 oscP5;
NetAddress dest;

// This array will hold all the humans detected
JSONObject data;

float x;
float y;
float[] top_lip_x = new float[12];
float[] top_lip_y = new float[12];
float[] bottom_lip_x = new float[12];
float[] bottom_lip_y = new float[12];
float[] lip_x = new float[24];
float[] lip_y = new float[24];



void setup() {
  // match sketch size to default model camera setup
  size(600, 400);
  fill(9, 130, 250);
  frameRate(10);   //lower frameRate for better performance
  runway = new RunwayOSC(this);   // setup Runway
  oscP5 = new OscP5(this, 9000);   // setup OSC
  dest = new NetAddress("127.0.0.1", 6448); // wekinator OSC port
  stroke(0, 255, 0);
  strokeWeight(1);
}

void draw() {
  background(0);
  
  fill(0, 255, 0);
  text( "face_landmarks Runway model tracks 24 mouth points (x,y)", 5, 15 );
  text( "Send them to to port 6448 with OSC message /wek/inputs", 5, 30 );
  // use the utiliy class to draw PoseNet parts
  if (data != null) {
    JSONArray labels = data.getJSONArray("labels");
    JSONArray landmarks = data.getJSONArray("points");
    if (landmarks != null)
    {
      for (int i = 0; i < landmarks.size(); i++) {
        String label = labels.get(i).toString();
        JSONArray point = landmarks.getJSONArray(i);  // get (x,y) and draw
        x = point.getFloat(0);
        y = point.getFloat(1);

        noFill();
        if (label.contains("lip")) {
          circle(x * width, y * height, 2);
          int k = i%24;
          lip_x[k] = x;
          lip_y[k] = y;

          if (k>1) {
            line(lip_x[k]*width, lip_y[k]*height, lip_x[k-1]*width, lip_y[k-1]*height);
          } else {
            line(lip_x[k]*width, lip_y[k]*height, lip_x[0]*width, lip_y[0]*height);
          }
        }
      }
      sendOsc(lip_x,lip_y);  // send 48 points as inputs to wekinator

    }
  }
}


// this is called when new Runway data is available
void runwayDataEvent(JSONObject runwayData) {
  // point the sketch data to the Runway incoming data
  data = runwayData;
}

void sendOsc(float[] lip_x,float[] lip_y) {
  OscMessage msg = new OscMessage("/wek/inputs");
  
  for (int k = 0; k < lip_x.length; k++) {
  msg.add((float)lip_x[k]);
  msg.add((float)lip_y[k]);
  }
  
  oscP5.send(msg, dest);
}
