class Tsukumogami{
  private PImage yokai3;
  private PImage yokai4;
  private PImage yokai5;
  private PVector posicion1;
  private PVector posicion2;
  private PVector posicion3;
  private int velocidad1;
  private int velocidad2;
  private int velocidad3;
  private PVector frames1;
  private PVector frames2;
  private PVector frames3;
  
  public Tsukumogami(){
    yokai3= requestImage("tsukumogami1.png");
    posicion1= new PVector(11,17);
    yokai4= requestImage("tsukumogami2.png");
    posicion2= new PVector(240,17);
    yokai5= requestImage("tsukumogami3.png");
    posicion3= new PVector(97,145);
    frames1= new PVector(0,0);
    frames2= new PVector(0,0);
    frames3= new PVector(0,0);
    velocidad1= 80;
    velocidad2= 70;
    velocidad3= 60;
    
  }
  
  public void display(){
    imageMode(CENTER);
    image(yokai3.get(int(frames1.x),int(frames1.y),110,100), posicion1.x,posicion1.y, 50,50);
    frames1.x += 100;
    if(frames1.x >= yokai3.width){
      frames1.x = 0;
      frames1.y += 110;
      if(frames1.y >= yokai3.height){
        frames1.y = 0;
      }
    }
    image(yokai4.get(int(frames2.x),int(frames2.y),100,300), posicion2.x,posicion2.y, 25,50);
    frames2.x += 100;
    if(frames2.x >= yokai4.width){
      frames2.x = 0;
      frames2.y += 300;
      if(frames2.y >= yokai4.height){
        frames2.y = 0;
      }
    }
    image(yokai5.get(int(frames3.x),int(frames3.y),100,250), posicion3.x,posicion3.y, 30,40);
    frames3.x += 100;
    if(frames3.x >= yokai5.width){
      frames3.x = 0;
      frames3.y += 250;
      if(frames3.y >= yokai5.height){
        frames3.y = 0;
      }
    }
  }
  
  public void mover(){
    // Mover el enemigo entre los límites del laberinto
    posicion1.x += (velocidad1 * Time.getDeltaTime(frameRate));
    if (posicion1.x >= 600 || posicion1.x <= 11) {
      velocidad1 = -velocidad1;
    }
    posicion2.y += (velocidad2 * Time.getDeltaTime(frameRate));
    if (posicion2.y >= 330 || posicion2.y <= 17) {
      velocidad2 = -velocidad2;
    }
    posicion3.x += (velocidad3 * Time.getDeltaTime(frameRate));
    if (posicion3.x >= 420 || posicion3.x <= 97) {
      velocidad3 = -velocidad3;
    }
  }
  
  public PVector getPosicion1() {
    return posicion1;
  }

  public PVector getPosicion2() {
    return posicion2;
  }

  public PVector getPosicion3() {
    return posicion3;
  }
}
