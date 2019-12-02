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
  
  float x() { return this.xPos; }
  float y() { return this.yPos; }
  
}
