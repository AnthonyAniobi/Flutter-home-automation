#include <SoftwareSerial.h>
#include "bluetooth_commands.hpp"
#include <Stepper.h>
#include <Servo.h> 
 
Servo myservo;                  
int servoPin = 7;
int servoPos = 0;    

int lightPin = 6;

// Defines the number of steps per rotation
const int stepsPerRevolution = 2038;

//variable for storing incoming values
SoftwareSerial bluetoothSerial(0, 1); //RX, TX

// stepper motor library
Stepper myStepper = Stepper(stepsPerRevolution, 8, 10, 9, 11);

// incoming value from bluetooth
char incoming_value = 0;

// bluetooth logger
String str_ii = "";
int ii_0 = 0;

// variable for storing states
bool lightIsOn = false;
bool windowIsOpen = false;
bool doorIsOpen = false;


void setup() {
  Serial.begin(115200);
  delay(1000);
  bluetoothSerial.begin(9600);
  delay(1000);
  bluetooth_help();
  // initialize servo
  myservo.attach(servoPin);
  pinMode(lightPin, OUTPUT);
  // initialize values
  initializeValues();
}

void loop() {
  // if bluetooth serial is available 
  // run the code 
  if(bluetoothSerial.available() > 0){
    incoming_value = bluetoothSerial.read();
    // log bluetooth value in the serial monitor
    Serial.print("Value gotten from the bluetooth is: ");
    Serial.println(incoming_value);
    
    switch (incoming_value){
        case OPEN_WINDOW:
          openWindow();
          break;
        case CLOSE_WINDOW:
          closeWindow();
          break;
        case OPEN_DOOR:
          openDoor();
          break;
        case CLOSE_DOOR:
          closeDoor();
          break;
        case TURN_ON_LIGHT:
          turnOffLight();
          break;
        case TURN_OFF_LIGHT:
          turnOnLight();
          break;
        default:
          break;
    }
  }
}

void openDoor(){
  if(!doorIsOpen){
    // Rotate clockwise at 8RPM
    myStepper.setSpeed(8);
    myStepper.step(stepsPerRevolution);
    doorIsOpen = true;
  }
}

void closeDoor(){
  if(doorIsOpen){ 
    // Rotate anti-clockwise at 8RPM
    myStepper.setSpeed(8);
    myStepper.step(-stepsPerRevolution);
    doorIsOpen = false;
  }
}

void openWindow(){
  if(!windowIsOpen){
    for(servoPos = 0; servoPos <= 180; servoPos += 1){                                  
      myservo.write(servoPos);      
      delay(15);                    
    } 
    windowIsOpen = true;
  }
}

void closeWindow(){
  if(windowIsOpen){
    for(servoPos = 180; servoPos >= 0; servoPos -= 1){                                  
      myservo.write(servoPos);      
      delay(15);                
    }
    windowIsOpen = false;
  }
}

void turnOnLight(){
  if(!lightIsOn){
    digitalWrite(lightPin, HIGH);
    lightIsOn = true;
  }
}

void turnOffLight(){
  if(lightIsOn){
    digitalWrite(lightPin, LOW);
    lightIsOn = false;
  }
}

void initializeValues(){
  myservo.write(0);
  digitalWrite(lightPin, LOW);
}

void bluetooth_help(){
 bluetoothSerial.println("AT+HELP?");
 while(true){
   char in_char = bluetoothSerial.read();
   if(int(in_char)== -1 or int(in_char)==42){continue;}
   str_ii += in_char;
   if(in_char == '\n') {
     if(str_ii = String('\r')+String('\n')){
       if(ii_0 == 0){
         ii_0 = 1;
         continue;
       }
       break;
     }
     Serial.print(str_ii);
     str_ii = "";
   }
 }
}

