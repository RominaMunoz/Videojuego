class Rokurokubi{
  private PImage yokai3;
  private PImage yokai4;
  private PImage yokai5;
  private PVector posicion;
  private PVector frames;
  
  public Rokurokubi(PVector posicion){
    yokai3= requestImage("enemigo2.png");
    this.posicion=posicion;
    frames= new PVector(0,0);
  }
  
  public void display(){
    imageMode(CENTER);
    image(yokai3.get(int(frames.x),int(frames.y),200,200), posicion.x,posicion.y, 100,200);
    frames.x += 200;
    if(frames.x >= yokai3.width){
        frames.x = 0;
        frames.y += 200;
        if(frames.y >= yokai3.height){
          frames.y = 0;
        }
      }
  }
}
