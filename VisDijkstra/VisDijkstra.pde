import controlP5.*;
ControlP5 cp5;
PFont font;
Table table;
boolean pathCalculated = false;
ArrayList<Node> path = new ArrayList<Node>();
ArrayList<Node> nodes = new ArrayList<Node>();
ArrayList<Edge> edges = new ArrayList<Edge>();
HashMap<String, Node> nodeTable = new HashMap();
ArrayList<Node> usedNodes = new ArrayList<Node>();
HashMap<Node, Node> previousNodes = new HashMap<Node, Node>();
ArrayList<Node> availableNodes = new ArrayList<Node>();
HashMap<Node, Float> distance = new HashMap<Node, Float>();
color edgeColour = color(243, 255, 82);
color nodeColour = color(0, 255, 0);
int c1, c2;
boolean begin = false;
int counter =0;
ArrayList<Edge> pathEdges = new ArrayList<Edge>();
Node origin;
Node end;
boolean isOn=false;
boolean isTree = false;


void setup() {
  size(600, 600);
  font = createFont("Serif", 10);
  textFont(font);
  table = loadTable("tubeedges.csv"); //Loading data set


  for (int i=0; i<table.getRowCount(); i++) { //for every, row in the table, add the edge between the two notes
    addEdge(table.getString(i, 0), table.getString(i, 1), table.getFloat(i, 2));
  } 
  cp5 = new ControlP5(this); 

  ///create a new button with name "Calculate"

  origin = nodes.get(0);

  cp5.addButton("Calculate")
    .setValue(1)
    .setPosition(20, 535)
    .setSize(200, 19)
    .activateBy(ControlP5.RELEASED);


  cp5.addButton("ShowTree")
    .setValue(1)
    .setPosition(20, 560)
    .setSize(200, 19)
    .activateBy(ControlP5.RELEASED);

  cp5.addButton("Chancery")
    .setValue(1)
    .setPosition(20, 445)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);

  cp5.addButton("NottingHill")
    .setValue(1)
    .setPosition(90, 445)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);

  cp5.addButton("Queensway")
    .setValue(1)
    .setPosition(160, 445)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);

  cp5.addButton("Lancaster")
    .setValue(1)
    .setPosition(230, 445)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);

  cp5.addButton("Oxford")
    .setValue(1)
    .setPosition(300, 445)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);

  cp5.addButton("Holborn")
    .setValue(1)
    .setPosition(370, 445)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);

  cp5.addButton("Pauls")
    .setValue(1)
    .setPosition(440, 445)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);

  cp5.addButton("Bank")
    .setValue(1)
    .setPosition(510, 445)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);


  cp5.addButton("ChanceryI")
    .setValue(1)
    .setPosition(20, 500)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);

  cp5.addButton("NottingHillI")
    .setValue(1)
    .setPosition(90, 500)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);

  cp5.addButton("QueenswayI")
    .setValue(1)
    .setPosition(160, 500)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);

  cp5.addButton("LancasterI")
    .setValue(1)
    .setPosition(230, 500)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);

  cp5.addButton("OxfordI")
    .setValue(1)
    .setPosition(300, 500)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);

  cp5.addButton("HolbornI")
    .setValue(1)
    .setPosition(370, 500)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);

  cp5.addButton("PaulsI")
    .setValue(1)
    .setPosition(440, 500)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);

  cp5.addButton("BankI")
    .setValue(1)
    .setPosition(510, 500)
    .setSize(60, 19)
    .activateBy(ControlP5.RELEASED);


  counter++;
  isOn = true;
}

void Title()
{
  fill(255);
  textSize(16);
  rect(20, 53, 550, 35);
  fill(0);
  text("Visualisation of Dijkstra's Algorithm on a graph of underground tube stations", 300, 70);
  fill(0);
  textSize(13);
  text("Begin by selecting the starting station:", 300, 430);
  text("Select destination station:", 300, 480);
}

void Calculate() {
  if (isOn)
  {
    println("on");
    println("origin"+origin.getLabel());
    Dijkstra(origin);
  } else {
    println("Off");
  }
}

void ShowTree() {
  if (isOn) {
    isTree = true;
  }
}


public void Chancery() {

  if (isOn)
  {

    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(5).getLabel())) {
        origin = node;
      }
    }
  }
}

public void NottingHill() {

  if (isOn)
  {

    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(0).getLabel())) {
        origin = node;
      }
    }
  }
}

public void Queensway() {
  if (isOn)
  {
    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(1).getLabel())) {
        origin = node;
      }
    }
  }
}

public void Lancaster() {
  if (isOn)
  {
    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(2).getLabel())) {
        origin = node;
      }
    }
  }
}

public void Oxford() {
  if (isOn)
  {
    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(3).getLabel())) {
        origin = node;
      }
    }
  }
}

public void Holborn() {

  if (isOn)
  {

    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(4).getLabel())) {
        origin = node;
      }
    }
  }
}

public void Pauls() {
  if (isOn)
  {
    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(6).getLabel())) {
        origin = node;
      }
    }
  }
}

public void Bank() {

  if (isOn)
  {

    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(7).getLabel())) {
        origin = node;
      }
    }
  }
}

public void ChanceryI() {
  if (isOn)
  {
    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(5).getLabel())) {
        end = node;
      }
    }
  }
}


public void NottinghillI() {

  if (isOn)
  {

    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(0).getLabel())) {
        origin = node;
      }
    }
  }
}


public void QueenswayI() {
  if (isOn)
  {
    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(1).getLabel())) {
        end = node;
      }
    }
  }
}


public void LancasterI() {
  if (isOn)
  {
    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(2).getLabel())) {
        end = node;
      }
    }
  }
}




public void OxfordI() {

  if (isOn)
  {

    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(3).getLabel())) {
        end = node;
      }
    }
  }
}


public void HolbornI() {

  if (isOn)
  {

    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(4).getLabel())) {
        end = node;
      }
    }
  }
}


public void PaulsI() {

  if (isOn)
  {

    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(6).getLabel())) {
        end = node;
      }
    }
  }
}

public void BankI() {

  if (isOn)
  {

    for (Node node : nodes) {
      println(node.getLabel());
      if (node.getLabel().equals(nodes.get(7).getLabel())) {
        end = node;
      }
    }
  }
}






public void controlEvent(ControlEvent theEvent) {   //Is called whenever a GUI Event happened
  System.out.println(theEvent.getName()); //Allows me to keep track of events being called
}


void draw() {
  background(87);
  Title();
  textSize(12);

  for (int i=0; i<edges.size(); i++) { //relax method is called in order to invoke a force directed layout
    edges.get(i).relax();
  }
  for (int i=0; i<nodes.size(); i++) { //relax method is called in order to invoke a force directed layout
    nodes.get(i).relax();
  }
  for (int i=0; i<nodes.size(); i++) { //update method called in order to update node positions
    nodes.get(i).update();
  } 
  adjacencyTable();


  if (pathCalculated) {
    if (isTree) {
      for (int i=0; i<pathEdges.size(); i++) {
        pathEdges.get(i).draw();
      }
    } else {
      for (int i=0; i<edges.size(); i++) { //draw edges

        edges.get(i).draw();
      }
    }
  } else {
    for (int i=0; i<edges.size(); i++) { //draw edges

      edges.get(i).draw();
    }
  }

  for (int i=0; i<nodes.size(); i++) { //draw nodes
    nodes.get(i).draw();
  }

  pathDetails();
}


void addEdge(String fromLabel, String toLabel, float weight) { //edge added to edges ArrayList
  println("addEdge");
  Node from = findNode(fromLabel);
  Node to = findNode(toLabel);
  Edge e = new Edge(from, to, weight); //new edge initialised
  edges.add(e); //edge added to edges arraylist
}

Node addNode(String name) { //adding Node to Node table and NodeArrayList and availableNodes List
  Node n = new Node(name);
  nodes.add(n);

  nodeTable.put(name, n);

  return n;
}

Node findNode(String label) { //Checks Node Table to see if node already exists
  label = label.toLowerCase();
  Node n = (Node) nodeTable.get(label);
  if (n==null) {
    return addNode(label);
  }
  return n;
}


void Dijkstra(Node origin) { 

  origin.startNode(true);
  distance.put(origin, 0.0); //origin added to adjacency table
  availableNodes.add(origin); //origin node added to availableNodes List because next step still needs to be determined

  while (availableNodes.size()>0) { 
    println(availableNodes.size());
    Node currentNode = getMinimum(availableNodes); //get Node with shortest distance from origin
    println("line277");
    println("minimum"+currentNode.getLabel());
    boolean exists = false;
    //Because HashSets arent available in processing, an ArrayList is used for 'usedNodes'. 
    for (int i=0; i<usedNodes.size(); i++) { 
      if (usedNodes.get(i).equals(currentNode)) {
        exists = true;
        break;
      }
    }
    //Check that the node doesnt already exist before adding
    if (exists == false) {
      usedNodes.add(currentNode);
      //  currentNode.changeColour();
      for (int k=0; k<usedNodes.size(); k++) {
        println("Used" + usedNodes.get(k).getLabel());
      }
    }
    availableNodes.remove(currentNode); //node is Removed from availableNodes list.
    println("avail"+availableNodes.size());
    findMinimalDistances(currentNode); //distances from mostrecently added Node are calculated
  }

  getPath(end);
  end.endNode(true);
}

void findMinimalDistances(Node node) {
  ArrayList<Node> adjacentNodes = getAdjacents(node);
  println("adj"+ adjacentNodes.size());
  for (Node target : adjacentNodes) {
    if (getShortestDistance(target) > getShortestDistance(node)
      + getDistance(node, target)) {
      distance.put(target, getShortestDistance(node)
        + getDistance(node, target));
      previousNodes.put(target, node);
      availableNodes.add(target);
    }
  }
}


float getDistance(Node node, Node target) { //distance between two nodes calculated by finding edge
  for (Edge edge : edges) {
    if ((edge.getFrom().equals(node)
      && edge.getTo().equals(target))||(edge.getFrom().equals(target)
      && edge.getTo().equals(node))) {
      return edge.getWeight();
    }
  }
  throw new RuntimeException("Should not happen");
}


ArrayList<Node> getAdjacents(Node myNode) { //Adjacent Nodes found
  ArrayList<Node> adjacents = new ArrayList<Node>(); 
  for (Edge anEdge : edges) {

    if ((anEdge.getFrom().equals(myNode))&& !usedNodes.contains(anEdge.getTo()))
    {
      adjacents.add(anEdge.getTo()); //Node is added to adjacents ArrayList
    } else
      if ((anEdge.getTo().equals(myNode)) && (!usedNodes.contains(anEdge.getFrom()))) {
        adjacents.add(anEdge.getFrom()); //Node is added to adjacents ArrayList
      }

    println(adjacents.size());
  }
  return adjacents;
}

Node getMinimum(ArrayList<Node> nodes) { //method that returns the Node at the shortest distance away
  Node minimum = null;
  for (Node currentNode : nodes) { //iterates for all nodes
    if (minimum == null) {
      minimum = currentNode;

      println("firstmin"+minimum.getLabel());
    } else {
      if
        (getShortestDistance(currentNode) < getShortestDistance(minimum)) { //checks if the distance to Node is smaller than current minimum.
        minimum = currentNode;
        println("369");
        //If so, minimum is updated to currentNode.
      }
    }
  }
  return minimum;
}

boolean isSettled(Node node) {
  return usedNodes.contains(node);
}

private float getShortestDistance(Node destination) { //Shortest distance to node is found in adjacency hash map
  Float d = distance.get(destination);
  println("distance"+distance.get(destination));
  if (d == null) { //if node is not found in distance hash map, 'infinity' is returned.
    println(destination.getLabel()+"notfound");
    return Integer.MAX_VALUE;
  } else {
    return d;
  }
}

void pathDetails() {
  rect(230, 535, 340, 45);
  fill(0, 102, 153);


  for (int i=path.size()-1; i>-1; i--) {

    text("Shortest Path: ", 270, 543);

    text(path.get(i).getLabel(), 390+(53*((path.size()-1)-1-i)), 543);
  }
  float totalWeight = 0;
  for (int j=pathEdges.size()-1; j>-1; j--) {
    text("Distances: ", 262, 556);
    String formatted = nf(pathEdges.get(j).getWeight(), 0, 2);
    text(formatted, 340+(35*((pathEdges.size()-1)-1-j)), 556);
    totalWeight = totalWeight + pathEdges.get(j).getWeight();
    if (j==0)
    {
      text("Total (in km): " + totalWeight, 282, 570);
    }
  }
}


void adjacencyTable() {
  rect(20, 120, 180, 280);
  stroke(255);
  strokeWeight(1.5);
  line(85, 120, 85, 400);
  line(20, 150, 200, 150);
  fill(0, 102, 153);
  text("Node", 50, 135);
  text ("Dist from: "+origin.getLabel(), 145, 135);

  for (int i=0; i<8; i++) {
    stroke(255);
    line(20, 150+(30*i), 200, 150+(30*i));
  }
  int j=1;
  int k=1;
  for (Node node : distance.keySet()) {

    text(node.getLabel(), 55, 135+(30*j));
    j++;
  }

  for (Float dist : distance.values()) {
    String formatted = nf(dist, 0, 2);
    text(formatted + " km", 140, 135+(30*k));
    k++;
  }
}

public ArrayList<Node> getPath(Node target) { //Path to a target Node calculted

  Node step = target; 
  Node oldStep = target;


  frameRate(2);


  // check if a path exists
  if (previousNodes.get(step) == null) {
    println("nullreturned");
    return null;
  } 

  path.add(step); // target added to path

  while (previousNodes.get(step) != null) { //previous nodes added to path
    step = previousNodes.get(step);
    for (Edge currentEdge : edges) {
      if (((currentEdge.getFrom()==oldStep)&&(currentEdge.getTo()==step))|| ((currentEdge.getFrom()==step)&&(currentEdge.getTo()==oldStep))) {
        if (!pathEdges.contains(currentEdge)) {
          pathEdges.add(currentEdge);
          currentEdge.setPath(true);
        }
        delay(500);
      }
    }
    path.add(step);
    oldStep = step;
    pathCalculated = true;
  }
  // Put it into the correct order
  println("Your path" +origin.getLabel()+  target.getLabel());
  for (int i=path.size()-1; i>-1; i--) {

    println(path.get(i).getLabel());
  }
  for (int j=path.size()-2; j>-1; j--) {
    println(pathEdges.get(j).getWeight());
  }


  for (Node nodes : distance.keySet())
  {
    println(nodes.getLabel());
  }
  println(distance.values());

  return path;
}


void keyPressed() {
  if (key == 's') {
    save("Graph2.png");
  }
}
