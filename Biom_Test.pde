Cell biom;
int time = 0;  //Makes so the preloader kan reset
int timer;     //A timer that works with counter
int counter = 500;  //How often the game goes through a new generation
int preloadtime = 20000;  //How long it goes through a new generation every frame (How long the "preloader" is active)

void setup() {
  //size(1250, 1000);
  fullScreen();
  biom = new Cell();
}

void draw() {
  biom.tegn();
  if (millis() < preloadtime) {  //Goes through a new generation every frame for a certain amount of time
    biom.generate();
  } else if (millis()-timer > counter) { // a timer
    biom.generate();
    timer = millis();
  } 


  timer();
}

void mousePressed() { // resets the game
  biom = new Cell();
  time = millis();
  preloadtime += millis();
}

void timer() { // a timer on the top right corner
  int currentTime = millis()-time;
  fill(0);
  textAlign(RIGHT);
  textSize(128);
  text(currentTime/1000, width-28, 128);
}
