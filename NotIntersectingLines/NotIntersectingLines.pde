/**
* The not intersecting lines graph tries to place a random line
* on a board with given lines. The line is tested against all
* other lines in the graph. If it's valid it gets added to the graph. 
* After a specified number of attempts the graph eventually ends and
* saves a jpg image in the output folder.
* 
* A graphical exploration written in the language of processing.
* Matthias Jäger, Graz 2018
*/

ArrayList<Line> graph = new ArrayList<Line>();
final int attempts = 900;
final int seed = 1773;

void setup() {
  size(800, 800);
  background(255);
  randomSeed(seed);
  
  // Adding the first line 
  //graph.add(randomLine());
  
  float nn = 0;
  float nm = 0;

  // Attempt adding more line
  for (int i = 0; i < attempts; i++) {
    Line next = noiseLine(nn, nm);

    int intersections = 0;
    
    for (Line g : graph) { 
      boolean intersect = doIntersect(g.v1, g.v2, next.v1, next.v2);
      if (intersect == true) {
        intersections++;
      }
    }
    
    // Only non intersecting lines get added
    if (intersections == 0) {
      graph.add(next);
      
      nm += 0.003;
      nn += 0.01;
    }
  }
  // Render the graph
  for (Line l : graph) { 
    l.render();
  }
  
  // Passepartout
  noFill();
  stroke(255);
  strokeWeight(40);
  rect(0, 0, width, height);
  // Output
  save("out/NotInterSect" + millis() + ".jpg");
  //exit();
}
