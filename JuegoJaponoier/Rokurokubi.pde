class Rokurokubi{
  private PImage yokai2;
  private PVector posicion;
  private PVector frames;
  private int vel;
  
  public Rokurokubi(PVector posicion){
    yokai2= requestImage("enemigo2.png");
    this.posicion=posicion;
    frames= new PVector(0,0);
    vel= 20;
  }
  
  public void display(){
    imageMode(CENTER);
    image(yokai2.get(int(frames.x),int(frames.y),2000,3000), posicion.x,posicion.y, 100,200);
    frames.x += 2000;
    if(frames.x >= yokai2.width){
      frames.x = 0;
      frames.y += 3000;
      if(frames.y >= yokai2.height){
        frames.y = 0;
      }
    }
  }
  
  public PVector getPosicion4() {
    return posicion.copy();
  }
}
