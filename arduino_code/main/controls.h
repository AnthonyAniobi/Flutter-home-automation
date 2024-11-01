#include <sys/unistd.h>
// Pre fixed Arduino controls
#include <Servo.h>

namespace Controls{
  class Custom{
    public:
    static void openServoDoor(int doorPin){
      
    }
  }

  class Fixed{
    private:
    Servo door1;
    Servo door2;
    Servo door3;
    Servo door4;
    bool door1isOpened = false;
    bool door2isOpened = false;
    bool door3isOpened = false;
    bool door4isOpened = false;
    bool light1isOn = false;
    bool light2isOn = false;
    bool light3isOn = false;
    bool light4isOn = false;
    const int openVal = 180;
    const int closeVal = 0;
    
    public:
    Fixed(){
      door1.attach(door1Pin);
      door2.attach(door2Pin);
      door3.attach(door3Pin);
      door4.attach(door4Pin);
      pinMode(light1, OUTPUT);
      pinMode(light2, OUTPUT);
      pinMode(light3, OUTPUT);
      pinMode(light4, OUTPUT);
    }
    static void openDoor1(){
      if(!door1isOpened){
        door1.write(openVal);
        door1isOpened = true;
      }
    }
    static void openDoor2(){
      if(!door2isOpened){
        door2.write(openVal);
        door2isOpened = true;
      }
    }
    static void openDoor3(){
      if(!door3isOpened){
        door3.write(openVal);
        door3isOpened = true;
      }
    }
    static void openDoor4(){
      if(!door4isOpened){
        door4.write(openVal);
        door4isOpened = true;
      }
    }
  }
}

