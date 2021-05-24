//#include <SoftwareSerial.h>
//
////variable for storing incoming values
//SoftwareSerial bluetooth(0, 1); //RX, TX
//
////char Incoming_value = 0;
//
//String str_ii = "";
//int ii_0 = 0;
//
//void setup() {
//  Serial.begin(115200);
//  delay(1000);
//  bluetooth.begin(9600);
//  delay(1000);
//  bluetooth_help();
//}
//
//void loop() {
//  // put your main code here, to run repeatedly:
////  if(Serial.available() > 0){
////    Icoming_value = Serial.read();
////    Serial.print(Incoming_value);
////    Serial.print("\n");
////
////    if(Incoming_value == '0'){
////      digitalWrite(8, LOW);
////    }else if(Incoming_value == '1'){
////      digitalWrite(8, HIGH);
////    }
////  }
////  delay(1);
//}
//
//void bluetooth_help(){
//  bluetooth.println("AT+HELP?");
//  while(true){
//    char in_char = bluetooth.read();
//    if(int(in_char)== -1 or int(in_char)==42){continue;}
//    str_ii += in_char;
//    if(in_char == '\n') {
//      if(str_ii = String('\r')+String('\n')){
//        if(ii_0 == 0){
//          ii_0 = 1;
//          continue;
//        }
//        break;
//      }
//      Serial.print(str_ii);
//      str_ii = "";
//    }
//  }
//}



int ledPin = 13;
int cmd = -1;
int flag = 0;

void setup() {
  pinMode(ledPin, OUTPUT);
  digitalWrite(ledPin, LOW);
  Serial.begin(9600);
}

void loop() {
  if (Serial.available() > 0) {
    cmd = Serial.read();
    flag = 1;
  }

  if (flag == 1) {
    if (cmd == '0') {
      digitalWrite(ledPin, LOW);
      Serial.println("LED: off");
    } else if (cmd == '1') {
      digitalWrite(ledPin, HIGH);
      Serial.println("LED: on");
    } else {
      Serial.print("unknown command: ");
      Serial.write(cmd);
      Serial.print(" (");
      Serial.print(cmd, DEC);
      Serial.print(")");

      Serial.println();
    }

    flag = 0;    
    cmd = 65;
  }

  Serial.flush();
  delay(100);
}

