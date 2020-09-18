import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class NotIntersectingLinesShirt extends PApplet {

final int attempts = 9000;

final float[] longs = {100, 200, 300};


class Line {

  PVector startVec, endVec;
  
  Line(PVector a, PVector b) {
    startVec = a; 
    endVec = b;
  }
  
  public void render() {
    line(startVec.x, startVec.y, endVec.x, endVec.y);
  }
}



ArrayList<Line> graph = new ArrayList<Line>();

public Line randomConstLine() {
  PVector next = PVector.random2D();
  next.mult(longs[floor(random(longs.length))]);
  PVector v1 = new PVector(random(width), random(height));
  PVector v2 = v1.copy().add(next);
  return new Line(v1, v2);
}

public boolean onSegment(PVector p, PVector q, PVector r) { 
  if (q.x <= max(p.x, r.x) && q.x >= min(p.x, r.x) && q.y <= max(p.y, r.y) && q.y >= min(p.y, r.y)) return true; 
  return false;
} 

public int orientation(PVector p, PVector q, PVector r) { 

  int colinear = 0, clock_wise = 1, counter_clock_wise = 2;
  int val = PApplet.parseInt((q.y - p.y) * (r.x - q.x) - (q.x - p.x) * (r.y - q.y)); 
  
  if (val == 0) return colinear;  
  return (val > 0)? clock_wise: counter_clock_wise;
} 

public boolean doIntersect(Line current, Line other) { 
  PVector a = current.v1, b = current.v2;
  PVector c = other.v1, d = other.v2;

  int orientation_ABC = orientation(a, b, c); 
  int orientation_ABD = orientation(a, b, d); 
  int orientation_CDA = orientation(c, d, a); 
  int orientation_CDB = orientation(c, d, b); 
  
  boolean isOnSegment_ACB = onSegment(a, c, b);
  boolean isOnSegment_ADB = onSegment(a, d, b);
  boolean isOnSegment_CAD = onSegment(c, a, d);
  boolean isOnSegment_CDB = onSegment(c, b, d);
  
  if (orientation_ABC != orientation_ABD && orientation_CDA != orientation_CDB) return true; 
  if (orientation_ABC == 0 && isOnSegment_ACB) return true; 
  if (orientation_ABD == 0 && isOnSegment_ADB) return true; 
  if (orientation_CDA == 0 && isOnSegment_CAD) return true; 
  if (orientation_CDB == 0 && isOnSegment_CDB) return true; 
  
  return false;
} 

public void setup() {
  
  background(255);
  
  // Adding the first line 
  graph.add(randomConstLine());

  // Attempt adding more line
  for (int i = 0; i < attempts; i++) {
    Line next = randomConstLine();

    int intersections = 0;
    
    for (Line g : graph) { 
      boolean intersect = doIntersect(g, next);
      if (intersect == true) {
        intersections++;
      }
    }
    
    // Only non intersecting lines get added
    if (intersections == 0) {
      graph.add(next);  
    }
  }
  
  // Render the graph
  for (Line l : graph) { 
    l.render();
  }
  
  // Output
  //save("out/NotInterSect" + millis() + ".jpg");
  //exit();
}
  public void settings() {  size(500, 700); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "NotIntersectingLinesShirt" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
