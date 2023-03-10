Cell biom;
int time = 0;
int timer;
int counter = 1000;
int preloadtime = 20000;

void setup() {
  //size(1250, 1000);
  fullScreen();
  biom = new Cell();
}

void draw() {
  biom.tegn();
  if (millis() < preloadtime) {
    biom.generate();
  } else if (millis()-timer > counter) {
    biom.generate();
    timer = millis();
  } 


  timer();
}

void mousePressed() {
  biom = new Cell();
  time = millis();
  preloadtime += millis();
}

void timer() { 
  int currentTime = millis()-time;
  fill(0);
  textAlign(RIGHT);
  textSize(128);
  text(currentTime/1000, width-28, 128);
}
