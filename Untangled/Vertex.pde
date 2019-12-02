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
