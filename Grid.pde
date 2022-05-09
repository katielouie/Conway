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
    
    void change(int x, int y) {
      cells[x][y] = !cells[x][y];
    }

    public void pressed() {
        if (mouseOver()){
            int i = (mouseX-x)/cellSize;
            int j = (mouseY-y)/cellSize;
            cells[i][j] = !cells[i][j];
        }
    }

    public boolean mouseOver() {
        return(mouseX > x && mouseX < x + (dim*cellSize) && mouseY > y && mouseY < y + (dim*cellSize));  
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
        boolean[][] newcells = new boolean[dim][dim];
        for (int i = 0; i < dim; i++){
            for (int j = 0; j < dim; j++) {
                int total = total(i, j);
                if (cells[i][j] && (total == 2 || total == 3)) {
                    newcells[i][j] = true;
                } 
                else if (total == 3) {
                    newcells[i][j] = true;
                }
                else {
                    newcells[i][j] = false;
                }
            }
        }
        cells = newcells;
    }

    public int total(int i, int j) {
        int count = 0;
         count += cells[(i-1+dim)%dim][(j-1+dim)%dim] ? 1:0;
         count += cells[(i-1+dim)%dim][j] ? 1:0;
         count += cells[(i-1+dim)%dim][(j+1)%dim] ? 1:0;
         count += cells[i][(j-1+dim)%dim] ? 1: 0;
         count += cells[i][(j+1)%dim] ? 1: 0;
         count += cells[(i+1)%dim][(j-1+dim)%dim]? 1: 0;
         count += cells[(i+1)%dim][j]? 1: 0;
         count += cells[(i+1)%dim][(j+1+dim)%dim]? 1: 0;
        return count;
    }
    
    public void randomize(int percent) {
        for (int i = 0; i < dim; i++){
            for (int j = 0; j < dim; j++) {
              cells[i][j] = (random(0,(100/percent)) == 0);
            }
        }
    }
    
}
