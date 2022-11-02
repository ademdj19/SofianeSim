<<<<<<< HEAD
class Arm{
  float armLength;
  Joint childJoint;
  Arm(float armlength_){
    armLength = armlength_;
  }
  void setChildJoint(Joint childjoint){
    childJoint = childjoint;
  }
  
  void update(){
    if(childJoint != null){
      childJoint.position = new PVector(armLength,0);
      childJoint.update();
    }
    show();

  }
  
  void show(){
    fill(ac);
    strokeWeight(3);
    stroke(242+20,232+20,99+20);
    rectMode(CORNER);
    rect(-10,-10,armLength+20,20,5);
    strokeWeight(3);
    stroke(255,25,45,100);
    line(0,0,armLength,0);
    strokeWeight(10);
    stroke(34,42,227,200);
    point(0,0);
    point(armLength,0);
  }
  
}
=======
class Arm{
  float armLength;
  Joint childJoint;
  Arm(float armlength_){
    armLength = armlength_;
  }
  void setChildJoint(Joint childjoint){
    childJoint = childjoint;
  }
  
  void update(){
    if(childJoint != null){
      childJoint.position = new PVector(armLength,0);
      childJoint.update();
    }
    show();

  }
  
  void show(){
    fill(ac);
    strokeWeight(3);
    stroke(242+20,232+20,99+20);
    rectMode(CORNER);
    rect(-10,-10,armLength+20,20,5);
    strokeWeight(3);
    stroke(255,25,45,100);
    line(0,0,armLength,0);
    strokeWeight(10);
    stroke(34,42,227,200);
    point(0,0);
    point(armLength,0);
  }
  
}
>>>>>>> c41b787176a4d1327d9b7e069e2a18523d8f649c
