class Node {
  float x, y;
  float dx, dy;
  String label;
  color currentCol = color(0, 0, 255);
  color original = color(0, 0, 255);
  color pathColor = color(252, 148, 181);

  //constructor
  Node(String label) {
    this.label = label;
    x = random(width);
    y = random(height);
  }

  String getLabel() {
    return this.label;
  }

  void relax() {
    float ddx = 0;
    float ddy = 0;

    for (int j = 0; j<nodes.size(); j++) {
      Node n = nodes.get(j);
      if (n!= this) {
        float vx = x-n.x;
        float vy = y-n.y;

        float lenSq = vx*vx+vy*vy;
        if (lenSq ==0) {
          ddx += random(1);
          ddy += random(1);
        } else if (lenSq < 100*100) {
          ddx += vx/lenSq;
          ddy += vy/lenSq;
        }
      }
    }
    float dlen = mag(ddx, ddy)/2;
    if (dlen >0) {
      dx += ddx/dlen;
      dy += ddy/dlen;
    }
  }

  void update() {
    x += constrain(dx, -5, 5);
    y += constrain(dy, -5, 5);

    x = constrain(x, 0+250, width-40);
    y = constrain(y, 0+150, height-230);

    dx/=2;
    dy/=2;
  }

  color startNode(boolean isStart) {
    if (isStart==true) {
      this.currentCol = color(0, 255, 0);
    }
    return currentCol;
  }

  color endNode(boolean isEnd) {
    if (isEnd==true) {
      this.currentCol = color(250, 3, 48);
    }
    return currentCol;
  }

  color changeCol(color currentColor) {
    if (currentColor==original) {
      this.currentCol = pathColor;
    } else {
      this.currentCol = original;
    }
    return currentCol;
  }

  void draw() {
    fill(currentCol);
    stroke(0);
    strokeWeight(0.5);
    ellipse(x, y, 10, 10);
    fill(255);
    textAlign(CENTER, CENTER);

    textSize(12);
    text(label, x, y-15);
  }
}
