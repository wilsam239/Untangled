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


UIButton b;

level l = new level();
public void setup() {
  
  background(225);
  noStroke();
  fill(102);

  b = new UIButton();
}

public void draw() {
  b.draw();
  for(int i = 0; i < l.getNumVertices(); i++) {
    ellipse(l.vertices.get(i).x(), l.vertices.get(i).y(), 50, 50);
  }
}
class UIButton extends UIElement {

    public UIButton() { }

    public UIButton(float top, float bottom, float left, float right) {
        this.top = top;
        this.bottom = bottom;
        this.left = left;
        this.right = right;
    }

    @Override
    public void draw() {
        fill(255, 0, 255);
        rect(this.left, this.top, this.right - this.left, this.bottom - this.top);
    }

}
abstract class UIElement {
    
    public float top = 0;
    public float bottom = 100;
    public float left = 0;
    public float right = 100;

    // ----- ALIGNMENT -----

    public void alignToptoTopOf(UIElement e) {
        this.top = e.top;
    }

    public void alignToptoBottomOf(UIElement e) {
        this.top = e.bottom;
    }

    public void alignBottomtoTopOf(UIElement e) {
        this.bottom = e.top;
    }

    public void alignBottomtoBottomOf(UIElement e) {
        this.bottom = e.bottom;
    }

    public void alignLeftToLeftOf(UIElement e) {
        this.left = e.left;
    }

    public void alignLeftToRightOf(UIElement e) {
        this.left = e.right;
    }

    public void alignRightToLeftOf(UIElement e) {
        this.right = e.left;
    }

    public void alignRightToRightOf(UIElement e) {
        this.right = e.right;
    }

    public void draw() { }

}
class level {
  ArrayList<vertices> vertices = new ArrayList();
  
  level() {
    for (int i = 0; i < 10; i++) {
      vertices.add(new vertices(random(0,1280), random(0,720)));
    }
  }
  
  public int getNumVertices() {
    return vertices.size();
  }
}
/**
  Vertex class, represents the circles on the page.
  Have an x,y position
*/

class vertices {
  private float xPos, yPos;
  
  vertices() {
    this.xPos = 0;
    this.yPos = 0;
  };
  
  vertices(float x, float y) {
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
