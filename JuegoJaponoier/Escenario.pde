class Escenario implements IDisplayable{
  private PImage fondo;
  private PImage inicio;
  private PImage ganar;
  private PImage perder;
  
  public Escenario(){
    fondo= requestImage("mapa1.png");
    inicio= requestImage("inicio.png");
    ganar= requestImage("ganar.png");
    perder= requestImage("perder.png");
  }
  
  public void display(){
    imageMode(CORNER);
    if (StateMachine.INICIANDO==true){
      image(inicio,0,0);
    }
    if (StateMachine.JUGANDO==true){
      image(fondo,0,0);
    }
    if (StateMachine.GANANDO==true){
      image(ganar,0,0);
    }
    if (StateMachine.PERDIENDO==true){
      image(perder,0,0);
    }
  }
}
