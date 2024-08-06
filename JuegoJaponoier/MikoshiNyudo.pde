class MikoshiNyudo{
  private PImage yokai1;
  private PVector posicion;
  private int velocidad;
  private PVector frames;
  
  public MikoshiNyudo(PVector posicion){
    yokai1= requestImage("enemigo1.png");
    this.posicion=posicion;
    frames= new PVector(0,0);
    velocidad= 70;
  }
  
  public void display(){
    imageMode(CENTER);
    image(yokai1.get(int(frames.x),int(frames.y),50,60), posicion.x,posicion.y, 50,50);
    frames.x += 50;
    if(frames.x >= yokai1.width){
      frames.x = 0;
      frames.y += 60;
      if(frames.y >= yokai1.height){
        frames.y = 0;
      }
    }
  }
  
  public void mover(){
    // Mover el enemigo de arriba a abajo entre los límites
    posicion.y += (velocidad * Time.getDeltaTime(frameRate));
    if (posicion.y >= 330 || posicion.y <= 130) {
      velocidad = -velocidad;
    }
  }
  
  public PVector getPosicion5() {
    return posicion;
  }
}
