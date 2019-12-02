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

public class Untangled extends PApplet {

Level l = new Level();
public void setup() {
  
  background(Colours.background);
  noStroke();
}

public void draw() {
  fill(Colours.vertexFill);
  stroke(Colours.vertexStroke);
  for(int i = 0; i < l.getNumVertices(); i++) {
    ellipse(l.vertices.get(i).x(), l.vertices.get(i).y(), Dimen.vertexDim, Dimen.vertexDim);
  }
}
public static class Colours {
    public static final int vertexFill = 255;
    public static final int vertexStroke = 0;

    public static final int background = 225;
}
public static class Dimen {
    public static final int gameWidth = 1280;
    public static final int gameHeight = 720;
    public static final int vertexDim = 50;

}
class Level {
  ArrayList<Vertex> vertices = new ArrayList();
  
  Level() {
    for (int i = 0; i < 10; i++) {
      vertices.add(new Vertex(random(0,1280), random(0,720)));
    }
  }
  
  public int getNumVertices() {
    return vertices.size();
  }
}
abstract class UIElement {
    
    public float top, bottom, left, right;

}
/**
  Vertex class, represents the circles on the page.
  Have an x,y position
*/

class Vertex {
  private float xPos, yPos;
  
 Vertex() {
    this.xPos = 0;
    this.yPos = 0;
  };
  
 Vertex(float x, float y) {
    this.xPos = x;
    this.yPos = y;
  }
  
  public float x() { return this.xPos; }
  public float y() { return this.yPos; }
  
}
  public void settings() {  size(1280,720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Untangled" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
