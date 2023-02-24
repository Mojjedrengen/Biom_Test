Cell biom;

void setup() {
  size(1000, 1250);
  //fullScreen();
  biom = new Cell();
  
}

void draw() {
  biom.tegn();
  biom.generate();
}
