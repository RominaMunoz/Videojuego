static class Time{
  static float getDeltaTime(float frame){
    int framesXsegundo= round(frame);
    float deltaTime= 1.0/framesXsegundo;
    return deltaTime;
  }
}
