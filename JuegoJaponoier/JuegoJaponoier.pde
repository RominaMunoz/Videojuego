private Enemigo enemigo;
private Escenario fondo;
private Personaje personaje;
private HUD vida;
private JoyPad control;
private int direccion;

public void setup(){
  size(900,600);
  frameRate(8);
  control= new JoyPad();
  PImage mapaColision = loadImage("mapaColision.png"); // Cargar la imagen de colisión
  Collider.iniciarColision(this,mapaColision); // Inicializar CollisionManager
  personaje= new Personaje(new PVector (width-40, height/2));
  fondo= new Escenario();
}

public void draw(){
  background(255);
  fondo.display();
  if(control.isUpPressed()){
    this.direccion=1;
  } else if(control.isDownPressed()){
    this.direccion=2;
  } else if(control.isLeftPressed()){
    this.direccion=3;
  } else if(control.isRightPressed()){
    this.direccion=4;
  } else {
    this.direccion=0;
  }
  personaje.setDireccion(this.direccion);
  personaje.display();
  personaje.mover();
}

public void keyPressed(){
  if(key=='w'|| keyCode==UP){
    control.setUpPressed(true);
  }
  if(key=='s'|| keyCode==DOWN){
    control.setDownPressed(true);
  }
  if(key=='a'|| keyCode==LEFT){
    control.setLeftPressed(true);
  }
  if(key=='d'|| keyCode==RIGHT){
    control.setRightPressed(true);
  }
}

public void keyReleased(){
  if(key=='w' || keyCode==UP){
    control.setUpPressed(false);
  }
  if(key=='s' || keyCode==DOWN){
    control.setDownPressed(false);
  }
  if(key=='a' || keyCode==LEFT){
    control.setLeftPressed(false);
  }
  if(key=='d' || keyCode==RIGHT){
    control.setRightPressed(false);
  }
}
