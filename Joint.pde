public class Joint{
  boolean root;
  PVector position;
  Arm arm;
  float maxAngle;
  float desiredAngle = 0.0;
  float angle = 0.0;
  float speed = 0.3;
  float offsetAngle = 0;
  float restAngle = 0;
  Joint(Arm arm_,float maxAngle_,float offsetAngle_){
    arm = arm_;
    position = new PVector(0,0);
    maxAngle = maxAngle_;
    angle = maxAngle/2;
    desiredAngle = angle;
    offsetAngle = offsetAngle_;
    restAngle = angle; 
  }
  Joint(Arm arm_,float maxAngle_,PVector position_,float offsetAngle_){
    arm = arm_;
    position = position_;
    maxAngle = maxAngle_;
    offsetAngle = offsetAngle_;
    angle = maxAngle/2;
    desiredAngle = angle;
    restAngle = angle;
  }
  void update(){
    float error = (round(abs((float)desiredAngle-(float)angle)*100000.0)/100000.0);
    if(error != 0){
      angle += min(speed,error)*(desiredAngle-angle)/abs(desiredAngle-angle);
    }
    pushMatrix();
    translate(position.x,position.y);
    rotate(radians(angle+offsetAngle));
    show();
    showArc();
    showAngleArc();
    arm.update();
    
    popMatrix();
  }
  void show(){
    rectMode(CENTER);
    fill(cj);
    rect(0,0,40,40,15);
    
  }
  void showArc(){
    noStroke();
    fill(bg2);
    arc(0,0,80,80,radians(-angle),radians(maxAngle-angle));
  }
  void showAngleArc(){
    noStroke();
    fill(255,50,54,120);
    arc(0,0,80,80,radians(-angle),0);
  }
  void setAngle(float angle){
    desiredAngle = min(maxAngle,max(-maxAngle,angle));
  }
}
