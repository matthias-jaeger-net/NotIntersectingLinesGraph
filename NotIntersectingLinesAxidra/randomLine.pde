Line randomLine() {
  PVector v1 = new PVector(random(width), random(height));
  PVector v2 = new PVector(random(width), random(height));
  return new Line(v1, v2);
}
