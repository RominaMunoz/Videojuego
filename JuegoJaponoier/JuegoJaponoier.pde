private Enemigo enemigo;
private Escenario fondo;
private Personaje personaje;
private JoyPad control;
private int direccion;

// Función de configuración inicial
public void setup(){
  size(900,600);
  frameRate(8);
  enemigo= new Enemigo();
  control= new JoyPad();
  PImage mapaColision = loadImage("mapaColision.png"); // Cargar la imagen de colisión
  Collider.iniciarColision(this,mapaColision); // Inicializar CollisionManager
  personaje= new Personaje(new PVector (width-40, height/2));
  fondo= new Escenario();
}

// Función principal de dibujo
public void draw(){
  background(255);
  fondo.display();
  if (StateMachine.JUGANDO) {
    enemigo.display();
    enemigo.mover();
    if (control.isUpPressed()) {
      this.direccion = 1;
    } else if (control.isDownPressed()) {
      this.direccion = 2;
    } else if (control.isLeftPressed()) {
      this.direccion = 3;
    } else if (control.isRightPressed()) {
      this.direccion = 4;
    } else {
      this.direccion = 0;
    }
    personaje.setDireccion(this.direccion);
    personaje.display();
    personaje.mover();
    if (Collider.colisiona1(personaje, enemigo)) {
      StateMachine.PERDIENDO = true;
      StateMachine.JUGANDO = false;
    }
    if (Collider.colisiona2(personaje, Collider.centro, Collider.radio)) {
      StateMachine.GANANDO = true;
      StateMachine.JUGANDO = false;
    }
  }
}

// Función para manejar las teclas presionadas
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

// Función para manejar las teclas liberadas
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
  
  if (keyCode == ENTER) {
    if (StateMachine.INICIANDO) {
      StateMachine.INICIANDO = false;
      StateMachine.JUGANDO = true;
      setup(); // Reiniciar el juego
    } else if (StateMachine.PERDIENDO) {
      StateMachine.PERDIENDO = false;
      StateMachine.INICIANDO = true;
    } else if (StateMachine.GANANDO) {
      StateMachine.GANANDO = false;
      StateMachine.INICIANDO = true;
    }
  }
}
