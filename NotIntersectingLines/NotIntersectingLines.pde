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
final int attempts = 90000;
final int seed = 12;

void setup() {
  size(600, 600);
  background(255);
  randomSeed(seed);

  // Adding the first line 
  graph.add(randomLine());
  
  // Attempt adding more line
  for (int i = 0; i < attempts; i++) {
    Line next = randomLine();
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
    }
  }
  // Render the graph
  for (Line l : graph) { 
    l.render();
  }
  // Output
  save("out/seed_" + seed + "_attempts_" + attempts + ".jpg");
  exit();
}
