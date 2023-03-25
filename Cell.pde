class Cell {
  int columns;
  int rows;
  int[][] board;

  int size = 10; //the size of the cells.

  Cell() {
    columns = width/size;
    rows = height/size;

    board = new int[columns][rows];
    for (int x = 0; x < columns; x++) { 
      for (int y = 0; y < rows; y++) {
        int temp = int(random(100)); // makes so i can make a procent chance it will be a specific game state
        if (temp < 20) { //Has a 20% chance to be water
          board[x][y] = 3;
        } else if (temp > 75) { // has a 25% chance to be grass
          board[x][y] = 1;
        } else { // is dirt if not the other
          board[x][y] = 0;
        }
      }
    }
  }

  void generate() {
    int[][] next = new int[columns][rows];
    //goes through every cell
    for (int x = 1; x < columns-1; x++) { 
      for (int y = 1; y < rows-1; y++) { 
        //resets neighbors and water neighbors
        int neighbors = 0; 
        int water = 0;
        // goes through the cells neighbors
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            neighbors += board[x+i][y+j]; //counts the gamestate of the neighbors
            if (board[x+i][y+j] == 3 || board[x+i][y+j] == 4) { // counts how many water neighbors there are
              water++;
            }
          }
        }
        neighbors -= board[x][y]; //minuses it self
        //Rules:
        //Grass
        if      ((board[x][y] > 0) && (neighbors <  2) && (board[x][y] < 3)) next[x][y] = 0;
        else if ((board[x][y] > 0) && (neighbors >  3) && (board[x][y] < 3)) next[x][y] = 1;
        else if ((board[x][y] == 0) && (neighbors == 3) && (board[x][y] < 3)) next[x][y] = int(random(1, 3));
        
        //Water
        else if ((board[x][y] > 0) && (water <  2)) next[x][y] = 0;
        else if ((board[x][y] > 0) && (water >  3)) next[x][y] = 3;
        else if ((board[x][y] == 0) && (water == 3)) next[x][y] = int(random(3, 5));
      }
    }
    board = next; //makes the temporary bord the real bord
  }

  void tegn() { //this could also be called display
  //goes through every celle to give them a collour
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < rows; j++) {
        if (board[i][j] == 1) { //grass
          fill(0, 255, 0);
        } else if (board[i][j] == 2) { //growing grass
          fill(100, 255, 150);
        } else if (board[i][j] == 3) { //water
          fill(0, 0, 255);
        } else if (board[i][j] == 4) { //flowing water
          fill(100, 200, 255);
        } else { //dirt
          fill(155, 118, 83);
        }
        stroke(0);

        rect(i*size, j*size, size, size);
      }
    }
  }
}
