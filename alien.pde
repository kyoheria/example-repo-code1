float angleToRotate = 0;
int i=1;
PImage alien;
void setup(){
  size (800,800);
  alien = loadImage("mig.jpg");
  imageMode(CENTER);
}
void draw(){
  background(255);
  
  angleToRotate += 1;
  image(alien, mouseX,mouseY,100,100);
  translate(200, 600-height/3);
  rotate(radians(angleToRotate));
  scale(0.4);
  drawScene(400,400);
  
}
void drawCarrot(float x, float y, int angle){
  triangle(x,y, x+40,y,x+20,y+80);   
  
}
void drawScene(float x, float y){
 
  float faceX = x;
  float faceY = y;
  float faceW = 400;
  float faceH = 500;
  float rEyeX = faceX + 100;
  float rEyeY = faceY;
  float lEyeX = faceX - 100;
  float lEyeY = faceY;
 
  drawFeet(faceX, faceY,faceW, faceH );
  drawArm(faceX, faceY, faceW, faceH);
  drawBody(faceX, faceY,faceH);
  drawEars(faceX, faceY);
  drawHead(faceX, faceY, faceW, faceH);
  
  drawEyes(rEyeX, rEyeY, lEyeX, lEyeY);
  drawNose(faceX, faceY);
  
  
  int i = 0;
  while (i < 35) {
    
    translate(-700, 200);
    fill(255, 100, 0);
    drawCarrot(i*100,i*100,i*100);

    pushMatrix();
    popMatrix();
    i = i + 1;
    rotate(radians(-angleToRotate * 2));
  } 
    
    
  
  
}

void drawHead(float x, float y, float w, float h) {
  strokeWeight(1);
  fill(230);
  ellipse(x, y, w, h);
}

void drawEars(float x, float y) {
  strokeWeight(1);
  fill(220);
  ellipse(x+50, y-350, 100, 250);
  ellipse(x-50, y-350, 100, 250);
}

void drawEyes(float rx, float ry, float lx, float ly) {
  
  fill(255);
  ellipse(rx, ry, 100, 100);
  ellipse(lx, ly, 100, 100);
  fill(0,100,200);
  float mouseDistanceModifier = 0.06;

  ellipse(rx + (mouseX - width/2) * mouseDistanceModifier, 
  ry + (mouseY - height/2) * mouseDistanceModifier, 50, 50);
  ellipse(lx + (mouseX - width/2) * mouseDistanceModifier, 
  ly + (mouseY - height/2) * mouseDistanceModifier, 50, 50);
}

void drawNose(float x, float y) {
  fill(0);
  float middleOfNose = y+100;
  ellipse(x,middleOfNose,50,50);
  line(x,middleOfNose,x+100, middleOfNose+10);
  line(x,middleOfNose,x+100, middleOfNose);
  line(x,middleOfNose,x+100, middleOfNose-10);
  line(x,middleOfNose,x-100, middleOfNose+10);
  line(x,middleOfNose,x-100, middleOfNose);
  line(x,middleOfNose,x-100, middleOfNose-10);
}

void drawBody(float x, float y,float h){
  fill(220);
  strokeWeight(1);
  fill(230);
  ellipse(x, y+h, 400, 600);
}

void drawArm(float x, float y,float w, float h){
  fill(220);
  strokeWeight(1);
  fill(230);
  float startR = x+w/2;
  float startL = x-w/2;
  
  ellipse(startR, y+w/2+50, 200, 50);
  
  ellipse(startL, y+w/2+50, 200, 50);
  
}

void drawFeet(float x, float y,float w, float h){
  strokeWeight(1);
  fill(220);
  ellipse(x+50, y+h+350, 100, 250);
  ellipse(x-50, y+h+350, 100, 250);
}