class Circle {
  float x, y; // position
  float v; // sin value
  float c; // color value
   
  Circle(float x, float y, float v, float c) {
  
    this.x=x;
    this.y=y;
    this.c=c;
    this.v=v;
  }
   
  void render() {
    
    //color and postion move with mouse
    fill(mouseX,255-c,c); 
    v+=0.1;
    ellipse(mouseX+x,mouseY+y,20*sin(v),20*sin(v));
  }
}