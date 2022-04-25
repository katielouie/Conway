class Grid implements Pressable{
    int x, y;
    int dim;
    int cellSize;
    boolean[] [] cells;

    Grid(int x, int y, int dim, int cellSize) {
        this.x = x;
        this.y = y;
        this.dim = dim;
        this.cellSize = cellSize;
        cells = new boolean[dim][dim];
        display();
    }

    public void pressed() {
        int i = Math.floor((mouseX-x)/cellSize);
    }

    public void mouseOver() {
        mouseX > x && mouseX < x + (dim*cellsize) && mouseY > y && mouseY < y + (dim*cellSize)) ?
        true : false;   
    }
    
    void display() {
        for (int i = 0; i < dim; i++){
            for (int j = 0; j < dim; j++) {
                fill(cells[i][j] ? 255: 0);
                rect(x+(i*cellSize),y+(j*cellSize),cellSize, cellSize);
            }
        }
    }
    

    void update() {
      for (int i = 0; i < dim; i++){
            for (int j = 0; j < dim; j++) {
                int total = total(i, j);
                if (total < 2 || total > 3) {
                    cells[i][j] = false;
                } 
                if (total == 3) {
                    cells[i][j] = true;
                }
            }
        }
        display();
    }

    int total(int i, int j) {
        int count = 0;
        count += cells[(i-1)%dim][(j-1)%dim] ? 1:0;
        count += cells[(i-1) %dim][j] ? 1:0;
        count += cells[(i-1)%dim][(j+1)%dim] ? 1:0;
        count +=cells[i][(j-1)%dim] ? 1: 0;
        count +=cells[i][(j+1)%dim] ? 1: 0;
        count +=cells[(i+1)%dim][(j-1)%dim]? 1: 0;
        count +=cells[(i+1)%dim][j]? 1: 0;
        count +=cells[(i+1)%dim][(j+1)%dim]? 1: 0;
        return count;
    }
    
}
