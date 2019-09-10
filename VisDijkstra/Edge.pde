class Edge {
  Node from;
  Node to;
  float weight;
  boolean isPath = false;
  color original = color(243, 255, 82);
  color pathColor = color(252, 148, 181);
  color currentColor;


  //constructor
  Edge(Node from, Node to, float weight) {
    this.from = from;
    this.to = to;
    this.weight = weight;
    this.currentColor = original;
  }

  void draw() {
    stroke(currentColor);
    strokeWeight(1.5);
    line(from.x, from.y, to.x, to.y);


    line(from.x, from.y, to.x, to.y);
    fill(0);
    rect((from.x+((to.x - from.x)/2))-15, (from.y+((to.y - from.y)/2))-7, 29, 15);
    fill(255);
    String format = nf(weight, 0, 2);
    text(format, from.x+((to.x - from.x)/2), from.y+((to.y - from.y)/2));
    text(format, from.x+((to.x - from.x)/2), from.y+((to.y - from.y)/2));
    text(format, from.x+((to.x - from.x)/2), from.y+((to.y - from.y)/2));
    if (isPath) {
      changeColor(currentColor);
    }
  }

  color changeColor(color currentColor) {
    if (currentColor==original) {
      this.currentColor = pathColor;
    } else {
      this.currentColor = original;
    }
    return currentColor;
  }

  Node getFrom() {
    return this.from;
  }

  Node getTo() {
    return this.to;
  }

  float getWeight() {
    return this.weight;
  }

  void setPath(boolean inPath) {
    this.isPath = inPath;
  }
  //add relax function  - force directed layout
  void relax() {
    //calculate the x component of vector between nodes 
    float vx = to.x - from.x;
    //calculate the y component of vector between nodes
    float vy = to.y - from.y;
    //calculate the magnitude of vector between nodes
    float d = mag(vx, vy);

    //make adjustments to to.dx, from.dx, to.dy and from.dy
    if (d>0) {
      float f = (60-d)/(d*3);
      float dx = f*vx;
      float dy = f*vy;
      to.dx += dx;
      to.dy += dy;
      from.dx -= dx;
      from.dy -= dy;
    }
  }
}
