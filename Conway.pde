int mode = 0;
int dim = 50;
int cellSize = 15; //15
Grid grid;

void setup() {
  //background(0);
  
  size(950, 750);
  grid = new Grid(0,0, dim, cellSize);
  frameRate(20);
}

void draw() {
  if (mode == 1) {
   grid.update();

  };   grid.display();
}

void mousePressed(){
  if (grid.mouseOver()) {
    grid.pressed();
  }
}

void keyPressed() {
  mode = (mode == 1) ? 0:1;
}
