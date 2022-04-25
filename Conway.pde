int go = 0;
int dim = 50;
int cellSize = 15;
Grid grid;

void setup() {
  //background(0);
  size(950, 750);
  grid = new Grid(0,0, dim, cellSize);
  // for (int x = 0; x < dim; x++){
  //   for (int y = 0; y < dim; y++) {
  //     cells[x][y] = new Cell(x*cellSize, y*cellSize, cellSize, true);
  //     cells[x][y].display();
  //   }
  // }
}

void draw() {
}
