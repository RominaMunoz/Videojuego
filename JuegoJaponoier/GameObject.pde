abstract class GameObject{
  protected PVector posicion;

  public GameObject(PVector posicion){
    this.posicion = posicion;
  }
  
  public abstract void display();
  public abstract void mover();
}
