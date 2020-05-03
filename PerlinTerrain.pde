//This is a 3D Terrain generation with Perlin Noise in Processing
int cols,rows;
int scl = 20; //scale
int w = 2000;
int h = 1600;

float[][] terrain;
float flying = 0;

void setup(){
  frameRate(60);
  size(600, 600, P3D);
  cols = w / scl;
  rows = h / scl;
 terrain = new float[cols][rows];
}
void draw(){
  
  flying -= 0.1;
  
  float yoff = flying;
  for (int y = 0; y < rows; y++){
   float xoff = 0;
   for (int x = 0; x < cols; x++) {
     terrain[x][y] = map(noise(xoff,yoff), 0, 1, -500, 500);
     xoff += 0.2;
   }
     yoff += 0.2;
 }
  
  background(0);
  colorMode(HSB);
  strokeWeight(1);
  stroke(255, 204, 100);

  noFill();
  
  translate(width/2, height/2+50);
  rotateX(PI/3);
  
  translate(-w/2, -h/2);
  
  for(int y = 0; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++){
      vertex(x*scl, y*scl, terrain[x][y] );
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
}
