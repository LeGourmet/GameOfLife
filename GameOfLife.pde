final int SIZE_CELL = 5;

int NB_CELLS_X;
int NB_CELLS_Y;
Cell grid[][];

void setup(){
  size(1800,900);
  
  NB_CELLS_X = width/SIZE_CELL-2;
  NB_CELLS_Y = height/SIZE_CELL-2;
  
  grid = new Cell[NB_CELLS_X][NB_CELLS_Y];
  for(int i=0; i<NB_CELLS_X ;i++)
    for(int j=0; j<NB_CELLS_Y ;j++)
      grid[i][j] = new Cell();

  background(127);
  noStroke();
  randomizeGrid();
}

void draw(){  
  for(int i=0; i<NB_CELLS_X ;i++)
    for(int j=0; j<NB_CELLS_Y ;j++){
      int state = grid[i][j].getState();
      if(state!=0){
        if(i>0){
                             grid[i-1][j].changingNeighborhoods(state);
          if(j>0)            grid[i-1][j-1].changingNeighborhoods(state);
          if(j<NB_CELLS_Y-1) grid[i-1][j+1].changingNeighborhoods(state);
        }
        if(i<NB_CELLS_X-1){
                             grid[i+1][j].changingNeighborhoods(state);
          if(j>0)            grid[i+1][j-1].changingNeighborhoods(state);
          if(j<NB_CELLS_Y-1) grid[i+1][j+1].changingNeighborhoods(state);
        }
        if(j>0)              grid[i][j-1].changingNeighborhoods(state);
        if(j<NB_CELLS_Y-1)   grid[i][j+1].changingNeighborhoods(state);
          
        fill(grid[i][j].getAlive() ? 0 : 255);
        rect((1+i)*SIZE_CELL,(1+j)*SIZE_CELL,SIZE_CELL,SIZE_CELL);
      }
    }
    
  for(int i=0; i<NB_CELLS_X ;i++)
    for(int j=0; j<NB_CELLS_Y ;j++)
      grid[i][j].update();
}

void keyPressed(){
  switch(key){
    case 'r' : randomizeGrid(); break; 
    case 'c' : clearBoard(); break;
  }
}
