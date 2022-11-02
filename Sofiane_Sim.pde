<<<<<<< HEAD
import controlP5.*;

ControlP5 cp5;

color bg1,bg2,cj,ac;
PShader blur;
Joint[] joints;
Arm[] arms;

boolean loading = true;
float loadingFrames = 0;
float Angle1,Angle2,Angle3;
IKSystem iksys;

void setup(){
  size(1024,680,P2D);
  noStroke();
  smooth(8);
  cp5 = new ControlP5(this);
  bg1 = color(#f0EAF2E3);
  bg2 = color(#f061E8E1);
  cj = color(#F25757);
  ac = color(#F2CD60);
  
  initJoints();
  
  
  preload();
}


void draw(){

  setGradient(bg1,bg2);
  fill(255,255,255,50);
  ellipse(width/2,height-175,2*width/3,200);
  filter(blur);
  joints[0].update();
  
  joints[0].setAngle(Angle1);
  joints[1].setAngle(Angle2);
  joints[2].setAngle(Angle3);
  iksys.drawEndEffectorPos();
}


// initializing joints

void initJoints(){
  arms = new Arm[3];
  for(int i = 0; i < 3;i++){
    arms[i] = new Arm(120);
  }
  joints = new Joint[3];
  // root joint
  joints[0] = new Joint(arms[0],180,new PVector(width/2,height-200),-180);
  for(int i = 1; i < 3;i++){
    joints[i] = new Joint(arms[i],180,-90);
  }
  
  // attache
  for(int i = 0; i < 2;i++){
    arms[i].setChildJoint(joints[i+1]);
  }
  
  // joints controllers
  for(int i = 0; i<3;i++){
    cp5.addSlider("Angle"+(i+1))
       .setPosition(50,height-50-30*i)
       //.hide()
       .setRange(0,180)
       .setSize(250,25)
       .setValue(90);
       ;
  }
  
  // init ik system
  iksys = new IKSystem(joints);
}

// gradient bg
void setGradient(color c1, color c2) {
  noFill();
  strokeWeight(1);

  for (int i = 0; i <= height; i++) {
    float inter = map(i, 0, height, 0, 1);
    color c = lerpColor(c2, c1, max(0,cos(inter)));
    stroke(c);
    line(0, i, width, i);
  } 
}
void preload(){
  println("loading started ...");
  blur = loadShader("blur.glsl");
  loading = false;
}
=======
import controlP5.*;

ControlP5 cp5;

color bg1,bg2,cj,ac;
PShader blur;
Joint[] joints;
Arm[] arms;

boolean loading = true;
float loadingFrames = 0;
float Angle1,Angle2,Angle3;
IKSystem iksys;

void setup(){
  size(1024,680,P2D);
  noStroke();
  smooth(8);
  cp5 = new ControlP5(this);
  bg1 = color(#f0EAF2E3);
  bg2 = color(#f061E8E1);
  cj = color(#F25757);
  ac = color(#F2CD60);
  
  initJoints();
  
  
  preload();
}


void draw(){

  setGradient(bg1,bg2);
  fill(255,255,255,50);
  ellipse(width/2,height-175,2*width/3,200);
  filter(blur);
  joints[0].update();
  
  joints[0].setAngle(Angle1);
  joints[1].setAngle(Angle2);
  joints[2].setAngle(Angle3);
  iksys.drawEndEffectorPos();
}


// initializing joints

void initJoints(){
  arms = new Arm[3];
  for(int i = 0; i < 3;i++){
    arms[i] = new Arm(120);
  }
  joints = new Joint[3];
  // root joint
  joints[0] = new Joint(arms[0],180,new PVector(width/2,height-200),-180);
  for(int i = 1; i < 3;i++){
    joints[i] = new Joint(arms[i],180,-90);
  }
  
  // attache
  for(int i = 0; i < 2;i++){
    arms[i].setChildJoint(joints[i+1]);
  }
  
  // joints controllers
  for(int i = 0; i<3;i++){
    cp5.addSlider("Angle"+(i+1))
       .setPosition(50,height-50-30*i)
       //.hide()
       .setRange(0,180)
       .setSize(250,25)
       .setValue(90);
       ;
  }
  
  // init ik system
  iksys = new IKSystem(joints);
}

// gradient bg
void setGradient(color c1, color c2) {
  noFill();
  strokeWeight(1);

  for (int i = 0; i <= height; i++) {
    float inter = map(i, 0, height, 0, 1);
    color c = lerpColor(c2, c1, max(0,cos(inter)));
    stroke(c);
    line(0, i, width, i);
  } 
}
void preload(){
  println("loading started ...");
  blur = loadShader("blur.glsl");
  loading = false;
}
>>>>>>> c41b787176a4d1327d9b7e069e2a18523d8f649c
