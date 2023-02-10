Cell biom;

void setup() {
  size(1000, 1000);
  biom = new Cell();
  
}

void draw() {
  biom.tegn();
  biom.generate();
}
