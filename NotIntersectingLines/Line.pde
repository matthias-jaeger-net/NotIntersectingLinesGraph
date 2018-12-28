class Line {
  PVector v1, v2;
  Line(PVector vStart, PVector vEnd) {
    v1 = vStart; 
    v2 = vEnd;
  }
  void render() {
    line(v1.x, v1.y, v2.x, v2.y);
  }
}
