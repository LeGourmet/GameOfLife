public class Cell{
  // ----------------------------------------------------- ATTRIBUTS -----------------------------------------------------
  private int _nbNeighbours;
  private int _state;        // -1=>die / 0=> no changement / 1=>born
  private boolean _alive; 
  
  // --------------------------------------------- DESTRUCTOR / CONSTRUCTOR ----------------------------------------------
  public Cell(){
    reset();
  }
  
  // ----------------------------------------------------- GETTERS -------------------------------------------------------
  public boolean getAlive(){ return _alive; }
  public int     getState(){ return _state; }
  
  // ---------------------------------------------------- FONCTIONS ------------------------------------------------------
  public void changingNeighborhoods(int p_state){ _nbNeighbours += p_state; }

  public void update(){
    _state = 0;
    
    if(_alive){
      _alive = (_nbNeighbours==2 || _nbNeighbours==3);
      if(!_alive) _state = -1;
    }else{
      _alive = (_nbNeighbours==3);
      if(_alive) _state = 1;
    }
  }

  public void randomize(){    
    boolean nextState = (random(1)<0.5);
    
    _nbNeighbours = 0;
    
    _state = 0;
    if(_alive && !nextState) _state = -1;
    if(!_alive && nextState) _state = 1;
    
    _alive = nextState;
  }
  
  public void reset(){
    this._nbNeighbours = 0;
    this._state        = 0;
    this._alive        = false;
  }

}
