static class Collider{
  private static PImage mapaColision;
  private static PApplet applet;
  private static PVector centro = new PVector(30, 137);
  private static int radio = 33;

  public static void iniciarColision(PApplet applet,PImage mapaColision) {
    Collider.mapaColision = mapaColision;
    Collider.mapaColision.loadPixels(); // Cargar los píxeles de la imagen de colisión
    Collider.applet = applet; //arregla un problema con el tema del color
  }

  //verifica la colision con el mapa para evitar que se salga o que choque con los muros
  public static boolean esTransitable(PVector posicion) {
    int x = (int) posicion.x;
    int y = (int) posicion.y;
    if (x < 0 || x >= mapaColision.width || y < 0 || y >= mapaColision.height) {
      return false; // Fuera de los límites del mapa
    }
    int loc = x + y * mapaColision.width;
    int pixelColor = mapaColision.pixels[loc];
    int wallColor = applet.color(0, 0, 0); // Definir el color negro de la pared como (0, 0, 0)
    
    // Verificacion de colision
    applet.println("Checking collision at:", x, y);
    applet.println("Pixel color:", pixelColor, "Wall color:", wallColor);
    
    return pixelColor != wallColor;
  }
  
  // Verifica si el personaje colisiona con los enemigos
  public static boolean colisiona1(Personaje personaje, Enemigo enemigo) {
    PVector[] posicionesEnemigos = enemigo.getPosiciones();
    for (PVector posicionEnemigo : posicionesEnemigos) {
      float distancia = PVector.dist(personaje.posicion, posicionEnemigo);
      if (distancia < 25) {
        return true;
      }
    }
    return false;
  }
  
  // Verifica si el personaje colisiona con la casita
  public static boolean colisiona2(Personaje personaje, PVector centro, float radio) {
    float distancia = PVector.dist(personaje.posicion, centro);
    return distancia <= radio;
  }
}
