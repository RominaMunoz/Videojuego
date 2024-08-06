class Enemigo {
  private Tsukumogami enemigo3;
  private MikoshiNyudo enemigo1;
  private Rokurokubi enemigo2;
  
  public Enemigo(){
    enemigo1= new MikoshiNyudo(new PVector(763,130));
    enemigo2= new Rokurokubi(new PVector(676, 185));
    enemigo3= new Tsukumogami();
  }
  
  public void display(){
    enemigo1.display();
    enemigo2.display();
    enemigo3.display();
  }
  public void mover(){
    enemigo1.mover();
    enemigo3.mover();
  }
}
