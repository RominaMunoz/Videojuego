class Personaje extends GameObject{
  
  private PImage descanso;
  private PImage camina;
  private PImage caminaI;
  private PImage caminaD;
  private PImage caminaE;
  private int direccion;
  private int velocidad;
  private int framesX;
  
  public Personaje(PVector posicion){
    super(posicion);
    descanso= requestImage("Descanso.png");
    camina= requestImage("Camina.png");
    caminaI= requestImage("CaminaI.png");
    caminaD= requestImage("CaminaD.png");
    caminaE= requestImage("CaminaE.png");
    direccion=0;
    velocidad= 50;
    framesX= 0;
  }
  
  public void display(){
    imageMode(CENTER);
    image(descanso.get(framesX,0,32,32), posicion.x,posicion.y, 40,40);
    framesX += 32;
    if(framesX >= descanso.width){
      framesX= 0;
    }
    //segun la direccion muestra una animacion para cuando camina
    switch(direccion){
      case 1:{
        imageMode(CENTER);
        image(caminaE.get(framesX,0,32,32), posicion.x,posicion.y, 40,40);
        framesX += 32;
        if(framesX >= caminaE.width){
          framesX= 0;
        }
        break;
      }
      case 2:{
        imageMode(CENTER);
        image(camina.get(framesX,0,32,32), posicion.x,posicion.y, 40,40);
        framesX += 32;
        if(framesX >= camina.width){
          framesX= 0;
        }
        break;
      }
      case 3:{
        imageMode(CENTER);
        image(caminaI.get(framesX,0,32,32), posicion.x,posicion.y, 40,40);
        framesX += 32;
        if(framesX >= caminaI.width){
          framesX= 0;
        }
        break;
      }
      case 4:{
        imageMode(CENTER);
        image(caminaD.get(framesX,0,32,32), posicion.x,posicion.y, 40,40);
        framesX += 32;
        if(framesX >= caminaD.width){
          framesX= 0;
        }
        break;
      }
    }
  }
   public void mover() {
    PVector nuevaPosicion = new PVector(posicion.x, posicion.y); //actualiza la posicion segun la colision
    switch (direccion) {
      case 1: {
        nuevaPosicion.y -= (velocidad * Time.getDeltaTime(frameRate));
        break;
      }
      case 2: {
        nuevaPosicion.y += (velocidad * Time.getDeltaTime(frameRate));
        break;
      }
      case 3: {
        nuevaPosicion.x -= (velocidad * Time.getDeltaTime(frameRate));
        break;
      }
      case 4: {
        nuevaPosicion.x += (velocidad * Time.getDeltaTime(frameRate));
        break;
      }
    }
    
    // Verificar colisiones usando la clase Collider
    if (Collider.esTransitable(nuevaPosicion)) {
      this.posicion = nuevaPosicion;
    } else {
      // Verificacion de colision
      println("Collision detected at position:", nuevaPosicion);
    }
  }
  
  public void setDireccion(int direccion) {
    this.direccion = direccion;
  }
}
