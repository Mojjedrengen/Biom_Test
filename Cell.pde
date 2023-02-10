class Cell {
  int columns;
  int rows;
  int[][] board;

  int size = 10;

  Cell() {
    columns = width/size;
    rows = height/size;

    board = new int[columns][rows];
    for (int x = 0; x < columns; x++) {
      for (int y = 0; y < rows; y++) {
        int temp = int(random(100));
        if (temp < 5) {
          board[x][y] = 2;
        } else if (temp > 70) {
          board[x][y] = 1;
        } else {
          board[x][y] = 0;
        }
      }
    }
  }

  void generate() {
    int[][] next = new int[columns][rows];
    for (int x = 1; x < columns-1; x++) {
      for (int y = 1; y < rows-1; y++) {
        int neighbors = 0;
        int water = 0;
        for (int i = -1; i <= 1; i++) {
          for (int j = -1; j <= 1; j++) {
            neighbors += board[x+i][y+j];
            if (board[x+i][y+j] == 2) {
              water++;
            }
          }
        }
        neighbors -= board[x][y];
        
        if      ((board[x][y] == 0) && (water >= 4)) next[x][y] = 2;
        else if ((board[x][y] == 1) && (water >= 6)) next[x][y] = 2;
        else if ((board[x][y] == 2) && (water <= 1)) next[x][y] = 0;
        else if ((board[x][y] == 1) && (neighbors <  2)) next[x][y] = 0;
        else if ((board[x][y] == 1) && (neighbors >  3)) next[x][y] = 0;
        else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1;
        else next[x][y] = board[x][y];
      }
    }
    board = next;
  }

  void tegn() {
    for (int i = 0; i < columns; i++) {
      for (int j = 0; j < columns; j++) {
        if (board[i][j] == 1) {
          fill(0, 255, 0);
        } else if (board[i][j] == 2) {
          fill(0, 0, 255);
        } else {
          fill(0);
        }
        stroke(0);

        rect(i*size, j*size, size, size);
      }
    }
  }
}
