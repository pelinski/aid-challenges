//https://www.tinkercad.com/things/6CuiqzS41bC-aid2challenge/editel
int pos = 0;
int sensorReading = 0;
int SPEAKER1 = 8;
int SPEAKER0 = 10;

void setup()
{
  pinMode(A0, INPUT);
  pinMode(A1, INPUT);
  pinMode(A2, INPUT);
  pinMode(SPEAKER1, OUTPUT);
  pinMode(SPEAKER0, OUTPUT);
  Serial.begin(9600);

}

void loop()
{
  // read the sensor
  sensorReading = analogRead(A4);
  noTone(SPEAKER0);
  noTone(SPEAKER1);
  
  // print the sensor reading so you know its range
  Serial.println(sensorReading);
  tone(SPEAKER0, modFrequency(220), 1000); // play tone 57 (A4 = 440 Hz)
  //noTone(SPEAKER0);


  // if button press on A0 is detected
  if (digitalRead(A0) == HIGH) {
    noTone(SPEAKER0);
    tone(SPEAKER1, modFrequency(440), 1000); // play tone 57 (A4 = 440 Hz)
      
    
  }
  // if button press on A1 is detected
  if (digitalRead(A1) == HIGH) {
    noTone(SPEAKER0);
    tone(SPEAKER1, modFrequency(494), 1000); // play tone 59 (B4 = 494 Hz)
      
  }
  // if button press on A0 is detected
  if (digitalRead(A2) == HIGH) {
    noTone(SPEAKER0);
    tone(SPEAKER1, modFrequency(523), 1000); // play tone 60 (C5 = 523 Hz)
      
  }
  delay(10); // Delay a little bit to improve simulation performance
}

int modFrequency(int f){
  // map the sensor reading to a range for the
  // speaker
  return (f * pow(2.0, (constrain(int(map(sensorReading, 0, 1023, 36, 84)), 35, 127) - 57) / 12.0));
}
