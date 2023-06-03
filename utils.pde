void clearBoard(){
  for(int i=0; i<NB_CELLS_X ;i++)
    for(int j=0; j<NB_CELLS_Y ;j++)
       grid[i][j].reset();
       
  clearDrawingBoard();
}

void clearDrawingBoard(){
  fill(255);
  rect(SIZE_CELL,SIZE_CELL,NB_CELLS_X*SIZE_CELL,NB_CELLS_Y*SIZE_CELL);
}

void randomizeGrid(){
  clearBoard();
  
  for(int i=0; i<NB_CELLS_X ;i++)
    for(int j=0; j<NB_CELLS_Y ;j++)
       grid[i][j].randomize();
}
