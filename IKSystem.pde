
class IKSystem{
  Joint[] joints;
  float[] thetas;

  IKSystem(Joint[] joints_){
    joints = joints_;
  }
  
  PVector endEffectorPosition(){
    float x = 0;
    float y = 0;
    thetas = new float[joints.length];
    float[] invThetas = new float[joints.length];
    for(int i = 0 ; i < thetas.length;i++){
      
      float theta_i = (180-joints[i].angle) - (90-(i>0 ? invThetas[i-1] : 0));
      invThetas[i] = theta_i; 
      thetas[i] = 90-theta_i; 
      x += cos(radians(90-theta_i))*joints[i].arm.armLength;
      y += sin(radians(90-theta_i))*joints[i].arm.armLength;
    }
    println(thetas);
    return new PVector(x,y);
  }
  
  void drawEndEffectorPos(){
    fill(255,145,12,190);
    noStroke();

    PVector absoluteEndEffectorPos = getAbsolutePos();
    println(absoluteEndEffectorPos);
    ellipse(absoluteEndEffectorPos.x,absoluteEndEffectorPos.y,40,40);
  }
  
  PVector getAbsolutePos(){
    PVector relativeEndEffectorPos = endEffectorPosition();
    
    return new PVector(
      joints[0].position.x - relativeEndEffectorPos.x ,
      joints[0].position.y - relativeEndEffectorPos.y
    );
  }
}
