//variable for storing incoming values
char Incoming_value = 0;

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(8, OUTPUT);
  digitalWrite(8, low);
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available() > 0){
    Icoming_value = Serial.read();
    Serial.print(Incoming_value);
    Serial.print("\n");

    if(Incoming_value == '0'){
      digitalWrite(8, LOW);
    }else if(Incoming_value == '1'){
      digitalWrite(8, HIGH);
    }
  }
  delay(1);
}
