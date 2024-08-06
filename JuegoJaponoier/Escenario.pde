class Escenario implements IDisplayable{
  private PImage fondo;
  
  public Escenario(){
    fondo= requestImage("mapa1.png");
  }
  
  public void display(){
    imageMode(CORNER);
    image(fondo,0,0);
  }
}
