class Line 
{
  PVector startVec, endVec;

  Line(PVector a, PVector b) {
    startVec = a; 
    endVec = b;
  }

  Line() {
    final float[] longs = {80, 240, 390};
    PVector randomStart = new PVector(random(width), random(height));
    PVector randomDirection = PVector.random2D();
    randomDirection.mult(longs[floor(random(longs.length))]);
    PVector randomEnd = randomStart.copy().add(randomDirection);
    startVec = randomStart;
    endVec = randomEnd;
  } 

  boolean isPointOnLine(PVector testPoint, Line segment) { 
    if (segment.endVec.x <= max(testPoint.x, segment.startVec.x) 
      && segment.endVec.x >= min(testPoint.x, segment.startVec.x) 
      && segment.endVec.y <= max(testPoint.y, segment.startVec.y) 
      && segment.endVec.y >= min(testPoint.y, segment.startVec.y)) 
      return true; 
    
    return false;
  }

  int orientation(PVector p, PVector q, PVector r) { 
    int colinear = 0, clock_wise = 1, counter_clock_wise = 2;
    int val = int((q.y - p.y) * (r.x - q.x) - (q.x - p.x) * (r.y - q.y)); 
    if (val == 0) return colinear;  
    return (val > 0)? clock_wise: counter_clock_wise;
  }

  boolean intersects(Line current) { 
    PVector a = current.startVec;
    PVector b = current.endVec;
    PVector c = startVec;
    PVector d = endVec;
    int colinear = 0;

    if (orientation(a, b, c) != orientation(a, b, d) 
      && orientation(c, d, a) != orientation(c, d, b)) return true; 

    if (orientation(a, b, c) == colinear 
      && isPointOnLine(c, current)) return true; 

    if (orientation(a, b, d) == colinear 
      && isPointOnLine(d, current)) return true; 

    if (orientation(c, d, a) == colinear 
      && isPointOnLine(a, new Line(c, d))) return true; 

    if (orientation(c, d, b) == colinear 
      && isPointOnLine(c, new Line(b, d))) return true; 

    return false;
  }

  void render() {
    line(startVec.x, startVec.y, endVec.x, endVec.y);
  }
  
}

void setup() {
  size(500, 700);
  background(255);
  
  ArrayList<Line> graph = new ArrayList<Line>();
  
  graph.add(new Line());
  
  for (int i = 0; i < 9000; i++) {
    int intersections = 0;
    
    Line newLine = new Line();
    
    for (Line currentLine : graph) 
      if (newLine.intersects(currentLine)) intersections++;
    
    if (intersections == 0) graph.add(newLine);
  }
  
  for (Line currentLine : graph) currentLine.render();
}
