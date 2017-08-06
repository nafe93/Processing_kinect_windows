import kinect4WinSDK.Kinect;
import kinect4WinSDK.SkeletonData;
import  java.io.File;
import java.awt.Robot;
import java.awt.*;
import java.awt.image.*;

Kinect kinect;
  ArrayList <SkeletonData> bodies;

//images for background 
String strImg = "1.png";

//position 
int hide = 1, hide2 = 1 ,hide3 =1;
int skiletSize = 2;
int h = 320, w = 240 , h2 = 320, w2 =240;
int x = 0 , y = 240 , x2 = 0 , y2= 0; 
int key3 = 0;

//screenShot
PImage screenShot;

void setup()
{
  size(768, 480); // 640 + 128 for image windows 640 * 480
  background(0);
  kinect = new Kinect(this);
  smooth();
  bodies = new ArrayList<SkeletonData>();
}

void takeScreenShot()
{
    Rectangle screenRect = new Rectangle( Toolkit.getDefaultToolkit().getScreenSize() );
    
    try {
        
        BufferedImage screenBuffer = new Robot().createScreenCapture( screenRect );
        
        screenShot = new PImage( screenBuffer.getWidth(), screenBuffer.getHeight(), PConstants.ARGB );
        screenBuffer.getRGB( 0, 0, screenShot.width, screenShot.height, screenShot.pixels, 0, screenShot.width  );
        screenShot.updatePixels();

        println(screenShot);
        
        //save part of image 
        PImage buf = get(0,0,640,480);
        buf.save("screenShot.bmp");
    
    } catch ( AWTException e ) {
        e.printStackTrace();
    }
} 

void printPath(File selection) {
  println(selection.getAbsolutePath());
  strImg = selection.getAbsolutePath();
}
 
void draw()
{
  background(55);
  PImage img_1;
  img_1 = loadImage(strImg);
  image(img_1, 0, y, h ,w);
  image(img_1, x2, y2, h2 ,w2);
    
  stroke(204,0,0);
  line(640, 0, 640, 710);
  
  //images for menu
  PImage img , img2 , img3 ,img4, img5;
  img = loadImage("1_1.jpg");
  img2 = loadImage("2_2.jpg");
  img3 = loadImage("3_3.jpg");
  img4 = loadImage("4_4.jpg");
  img5 = loadImage("add.png");
     
  // картинки  
  image(img, 650, 10, 100 ,76);
  image(img2, 650, 100, 100 ,76);
  image(img3, 650, 200, 100 ,76);
  image(img4, 650, 300, 100 ,76);
  image(img5, 650, 380, 100 ,100);
    
  if ( mouseX > 650 && mouseX < 768 && mouseY > 10 && mouseY < 76 ) {
    // mouseOver
    cursor(HAND);
    pushMatrix();
    translate(width/2, height/2);
    rotate(350*TWO_PI/360);
    image(img, 285, -175, 120 ,90); 
    popMatrix();
     if(mousePressed && (mouseButton == LEFT)){
         strImg = "1.png";
     }
  }
  else if(mouseX > 650 && mouseX < 768 && mouseY > 100 && mouseY < 176){
     cursor(HAND);
     pushMatrix();
     translate(width/2, height/2);
     rotate(10*TWO_PI/360);
     image(img2, 235, -200, 120 ,90);  
     popMatrix();
     if(mousePressed && (mouseButton == LEFT)){
         strImg = "2.png";
     }
  }
    else if(mouseX > 650 && mouseX < 768 && mouseY > 200 && mouseY < 276){
     cursor(HAND);
     pushMatrix();
     translate(width/2, height/2);
     rotate(350*TWO_PI/360);
     image(img3, 255, 0, 120 ,90);  
     popMatrix(); 
     if(mousePressed && (mouseButton == LEFT)){
         strImg = "3.png";
     }
  }
  else if(mouseX > 650 && mouseX < 768 && mouseY > 300 && mouseY < 376){
     cursor(HAND);
     pushMatrix();
     translate(width/2, height/2);
     rotate(10*TWO_PI/360);
     image(img4, 270, 0, 120 ,90);    
     popMatrix(); 
     if(mousePressed && (mouseButton == LEFT)){
         strImg = "4.png";
     }
  }
  else if(mouseX > 650 && mouseX < 768 && mouseY > 400 && mouseY < 476){
     cursor(HAND);
     pushMatrix();
     image(img5, 640, 370, 120 ,120);      
     popMatrix(); 
     if(mousePressed && (mouseButton == LEFT)){
         //strImg = "5.png";
         selectInput("Select a file to process:", "printPath"); 
     }
  }
  else if (mouseX > 0 && mouseX < 320 && mouseY > 240 && mouseY < 480)
  {
    cursor(HAND);
    if(mousePressed && (mouseButton == LEFT) && key3 == 0){
      h = 640;
      w = 480;
      y = 0;
      x2 = 10000;
      y2 = 10000;
      hide = 100;
      skiletSize = 1000;
      key3 = 1;
    }
    else if(mousePressed && (mouseButton == LEFT) && key3 == 1){
      h = 320;
      w = 240;
      y = 240;
      x2 = 0;
      y2 = 0;
      hide = 1;
      skiletSize = 2;
      key3 = 0;
    }  
  }  
  else if (mouseX > 0 && mouseX < 320 && mouseY > 0 && mouseY < 240){
    cursor(HAND);
     if(mousePressed && (mouseButton == LEFT) && key3 == 0){
       //h = 640;
       //w = 480;
       //y = 0;
       h2 = 640;
       w2 = 480;
       hide = hide3 = 10000;
       skiletSize = 1;
       key3 = 1;
     }
     if(mousePressed && (mouseButton == LEFT) && key3 == 1){
       h2 = 640;
       w2 = 480;
       hide = hide2 = 1;
       skiletSize = 2;
       key3 = 1;
     }
  }
  else if (mouseX > 384 && mouseX < 640 && mouseY > 0 && mouseY < 240){
    cursor(HAND);
     if(mousePressed && (mouseButton == LEFT) && key3 == 0)
     {
       x2 = 10000;
       y2 = 10000;
       h = 640;
       w = 480;
       y = 0;
       hide = 100;
       skiletSize = 1;
       key3 = 1;
     }
  }
  else if (mouseX > 384 && mouseX < 640 && mouseY > 240 && mouseY < 480){
    cursor(HAND);
    if(mousePressed && (mouseButton == LEFT) && key3 == 0)
     {
       takeScreenShot();
       key3 = 0;
     }
  }
  else{
     cursor(ARROW);
  }
  
  //Получаем изображение
  //GetImage 640 x 480 ARGB
  //GetMask 640 x 480 ARGB AND USING AlphaCanal
  
  image(kinect.GetImage(), 320*hide*hide3, 0, 320, 240);
  image(kinect.GetDepth(), 320*hide*hide3, 240, 320, 240);
  image(kinect.GetMask(), 0, y*hide2*hide3, h, w);
  
  //Отрисовка скилета
  for (int i=0; i<bodies.size (); i++) 
  {
    drawSkeleton(bodies.get(i));
    drawPosition(bodies.get(i));
  }
}
 // цифры
void drawPosition(SkeletonData _s) 
{
  noStroke();
  fill(0, 100, 255);
  String s1 = str(_s.dwTrackingID);
  text(s1, _s.position.x*width/2, _s.position.y*height/2);
}
 
void drawSkeleton(SkeletonData _s) 
{
  // Body
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HEAD, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_SPINE);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SPINE, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
 
  // Left Arm
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT, 
  Kinect.NUI_SKELETON_POSITION_WRIST_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_WRIST_LEFT, 
  Kinect.NUI_SKELETON_POSITION_HAND_LEFT);
 
  // Right Arm
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_HAND_RIGHT);
 
  // Left Leg
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT, 
  Kinect.NUI_SKELETON_POSITION_FOOT_LEFT);
 
  // Right Leg
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_HIP_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT);
  DrawBone(_s, 
  Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT, 
  Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT);
}
 //отрисовка скилета (наложение)
void DrawBone(SkeletonData _s, int _j1, int _j2) 
{
  noFill();
  stroke(255, 255, 0);
  if (_s.skeletonPositionTrackingState[_j1] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
    _s.skeletonPositionTrackingState[_j2] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
    // размеры скилеты
    line(_s.skeletonPositions[_j1].x*width/skiletSize, 
    _s.skeletonPositions[_j1].y*height/skiletSize,  
    _s.skeletonPositions[_j2].x*width/skiletSize, 
    _s.skeletonPositions[_j2].y*height/skiletSize);
  }
}
 //Хранить новые значения скилета
void appearEvent(SkeletonData _s) 
{
  if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  //добавляем скилет
  synchronized(bodies) {
    bodies.add(_s);
  }
}
//если исчесзла фигура 
void disappearEvent(SkeletonData _s) 
{
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.remove(i);
      }
    }
  }
}
 //когда отслеживаются фигура остается в пределах экрана и может перемещаться
void moveEvent(SkeletonData _b, SkeletonData _a) 
{
  if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
  {
    return;
  }
  synchronized(bodies) {
    for (int i=bodies.size ()-1; i>=0; i--) 
    {
      if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
      {
        bodies.get(i).copy(_a);
        break;
      }
    }
  }
}