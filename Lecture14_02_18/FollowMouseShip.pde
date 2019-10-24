class FollowMouseShip
{
   float x,y,z,speed,theta,size,fx,fy;
   color c;
   Bullet bullet;
  FollowMouseShip()
  {
    x = width/2;
    y = height/2;
    z = 0;
    speed = 5;
    theta = 0;
    size = 200;
  }
  
  FollowMouseShip(float x, float y)
  {
    this.x = x;
    this.y = y;
    z = 0;
    speed = 5;
    theta = 0;
    size = 50;
    c = color(random(0,255),255,255);
  }
  
  void render()
    {  
      pushMatrix();
      translate(x,y);
      rotate(theta);
      stroke(c);
      
      float halfS = size/2;
      line(0,0,0-halfS,0+size);
      line(0,0,0+halfS,0+size);
      line(0+halfS,0+size,0,0+halfS);
      line(0-halfS,0+size,0,0+halfS);
      
      popMatrix();
    }
    
    void Update()
    {
      float o = mouseX - x, a = mouseY - y;
      theta = atan2(a,o)+90;
      fx = sin(theta);
      fy = -cos(theta);
      x += fx;
      y += fy;
      //x = lerp(x,mouseX,0.02f);
      //y = lerp(y,mouseY,0.02f)
      
      
      
      
      
      
      if (dist(mouseX,mouseY,x,y) > 5)
      {
        //set new pos
      }
      
    if (keyPressed)
    {
      bullet = new Bullet(this.x,this.y);
    
      bullet.Update();
      bullet.showBullets();
    }
    }
}