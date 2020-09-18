Line noiseLine(float n, float m) {
  PVector v1 = new PVector(random(width), noise(n) * height);
  PVector v2 = v1.copy();
  PVector v3 = PVector.random2D().mult(noise(m) * random(width));
  v2.add(v3);
  return new Line(v1, v2);
}
