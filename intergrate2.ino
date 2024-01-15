#include <TinyGPSPlus.h> //gps
#include <Wire.h> //가속도
#include "DFRobotDFPlayerMini.h" //mp3
#include <WiFi.h> //wifi
#include <HTTPClient.h> //wifi

int theft = 0;

String user_id = "asd";

const char* ssid = "CAMPUS_G";     // WIFI ID
const char* password = "SMHRDg7777";  // WIFI PW

// Server 요청 주소
String address = "http://172.30.1.5:8081/bicycle"; // host
String DBAddress = "/test1"; // req. 스프링 컨트롤러 urlMapping
String LocationAddress = "/NowLocationSave";
String returnAddress = "/test3";
String queryString = "data=35.450701&&data2=127.111111"; //쿼리스트링으로 센서값 보내면댐
int URLNum = 1;

String result = "";  // 응답 결과 저장
HTTPClient http;     // 통신 객체

//가속도
long accelX, accelY, accelZ;
float gForceX, gForceY, gForceZ;

//가속도
long gyroX, gyroY, gyroZ;
float rotX, rotY, rotZ;

//mp3
HardwareSerial mySerial(1);

//mp3
DFRobotDFPlayerMini myDFPlayer;

//gps
TinyGPSPlus gps;
//rx 17번 / tx 16번 고정
// 3.3v
//baud

void setup() {
  //mp3
  mySerial.begin(9600, SERIAL_8N1, 14, 27);
  if (!myDFPlayer.begin(mySerial)) {  // MP3 모듈 시작
    Serial.println("DFPlayer Mini를 찾을 수 없습니다. 체크바랍니다.");
    while (true);
  }

  //gps
  Serial.begin(9600);
  Serial2.begin(9600);

  //가속도
  Wire.begin();
  setupMPU();
  delay(3000);

  //wifi
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi..");
  }

  Serial.println("Connected to the WiFi network");
}

void updateSerial(){ //gps
  delay(500);
  while (Serial.available())  {
    Serial2.write(Serial.read());//Forward what Serial received to Software Serial Port
  }
  while (Serial2.available())  {
    Serial.write(Serial2.read());//Forward what Software Serial received to Serial Port
  }
}

void displayInfo() //gps
{
  Serial.print(F("Location: "));
  if (gps.location.isValid()){
    Serial.print(gps.location.lat(), 6);
    Serial.print(F(","));
    Serial.println(gps.location.lng(), 6);
  }
  else
  {
    Serial.println(F("INVALID"));
  }
}

void setupMPU(){ //가속도
  Wire.beginTransmission(0b1101000); //This is the I2C address of the MPU (b1101000/b1101001 for AC0 low/high datasheet sec. 9.2)
  Wire.write(0x6B); //Accessing the register 6B - Power Management (Sec. 4.28)
  Wire.write(0b00000000); //Setting SLEEP register to 0. (Required; see Note on p. 9)
  Wire.endTransmission();  
  Wire.beginTransmission(0b1101000); //I2C address of the MPU
  Wire.write(0x1B); //Accessing the register 1B - Gyroscope Configuration (Sec. 4.4) 
  Wire.write(0x00000000); //Setting the gyro to full scale +/- 250deg./s 
  Wire.endTransmission(); 
  Wire.beginTransmission(0b1101000); //I2C address of the MPU
  Wire.write(0x1C); //Accessing the register 1C - Acccelerometer Configuration (Sec. 4.5) 
  Wire.write(0b00000000); //Setting the accel to +/- 2g
  Wire.endTransmission(); 
}

void recordAccelRegisters() { //가속도
  Wire.beginTransmission(0b1101000); //I2C address of the MPU
  Wire.write(0x3B); //Starting register for Accel Readings
  Wire.endTransmission();
  Wire.requestFrom(0b1101000,6); //Request Accel Registers (3B - 40)
  while(Wire.available() < 6);
  accelX = Wire.read()<<8|Wire.read(); //Store first two bytes into accelX
  accelY = Wire.read()<<8|Wire.read(); //Store middle two bytes into accelY
  accelZ = Wire.read()<<8|Wire.read(); //Store last two bytes into accelZ
  processAccelData();
}

void processAccelData(){ //가속도
  gForceX = accelX / 16384.0;
  gForceY = accelY / 16384.0; 
  gForceZ = accelZ / 16384.0;
}

void recordGyroRegisters() { //가속도
  Wire.beginTransmission(0b1101000); //I2C address of the MPU
  Wire.write(0x43); //Starting register for Gyro Readings
  Wire.endTransmission();
  Wire.requestFrom(0b1101000,6); //Request Gyro Registers (43 - 48)
  while(Wire.available() < 6);
  gyroX = Wire.read()<<8|Wire.read(); //Store first two bytes into accelX
  gyroY = Wire.read()<<8|Wire.read(); //Store middle two bytes into accelY
  gyroZ = Wire.read()<<8|Wire.read(); //Store last two bytes into accelZ
  processGyroData();
}

void processGyroData() { //가속도
  rotX = gyroX / 131.0;
  rotY = gyroY / 131.0; 
  rotZ = gyroZ / 131.0;
}

void printData() { //가속도
  Serial.print("Gyro (deg)");
  Serial.print(" X=");
  Serial.print(rotX);
  Serial.print(" Y=");
  Serial.print(rotY);
  Serial.print(" Z=");
  Serial.print(rotZ);
  Serial.print(" Accel (g)");
  Serial.print(" X=");
  Serial.print(gForceX);
  Serial.print(" Y=");
  Serial.print(gForceY);
  Serial.print(" Z=");
  Serial.println(gForceZ);
}

void loop() {
  //gps
  //updateSerial();
  while (Serial2.available() > 0)
    if (gps.encode(Serial2.read()))
      displayInfo();
  if (millis() > 5000 && gps.charsProcessed() < 10)
  {
    Serial.println(F("No GPS detected: check wiring."));
  }

  //가속도
  recordAccelRegisters();
  recordGyroRegisters();
  printData();




String lat = String(gps.location.lat(), 6);
String lng = String(gps.location.lng(), 6);
  if ((WiFi.status() == WL_CONNECTED)) {  //Check the current connection status


// http://172.30.1.5:8081/bicycle/test?data=1234
    if(URLNum==1000){ //db저장 메서드로 보내는 주소값 /test1
      http.begin(address + DBAddress + "/?lat="+lat+"&lng="+lng+"&theft="+theft+"&user_id="+user_id);
    }else if(URLNum!=1000&&URLNum%2==0){ //아두이노로 리턴값 보냄 /test3
      http.begin(address + returnAddress + "/?lat="+lat+"&lng="+lng+"&theft="+theft+"&user_id="+user_id);

    }else if(URLNum!=1000&&URLNum%2==1){ //현재위치 확인 메서드로 보내는 주소값 /test2
      http.begin(address + LocationAddress + "/?lat="+lat+"&lng="+lng+"&theft="+theft+"&user_id="+user_id);
    }

    int httpCode = http.GET();  // 응답코드
    if (httpCode > 0) {

      Serial.println(httpCode);   // 응답코드 출력
      result = http.getString();  // 응답 결과 저장
      Serial.println(result);     // 응답 결과 출력
      if(String(result.charAt(1))=="3"){
        theft = 0;
      }
    }else{
      Serial.println("httpCode : "+httpCode);
    }

  //mp3
  if(String(result.charAt(0))=="0"){
    if ((0.3<gForceX&&gForceX<3.7)||(0.3<gForceY&&gForceY<3.7)){
      Serial.println("도난감지됨!!!!!");
      myDFPlayer.volume(5);  // 볼륨 설정 (0에서 30까지)
      myDFPlayer.play(1);  // 첫 번째 곡 재생
      //스프링으로 알림울린거 값 보내는 로직
      theft = 1;
    }
  }

    http.end();
  } else {
    Serial.println("Error on HTTP request");
  }

  URLNum += 1;
  if(URLNum>1000){
    URLNum=1;
  }

  // 0->주차 1->이동 2->그냥보냄 3->알림중지버튼 클릭시!
  
}