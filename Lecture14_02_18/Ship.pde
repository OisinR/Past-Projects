class Ship
{
 float x,y,z,speed,theta,size,fx,fy;

  Ship()
  {
    x = width/2;
    y = height/2;
    z = 0;
    speed = 5;
    theta = 0;
    size = 50;
  }
  
  Ship(float x, float y)
  {
    this.x = x;
    this.y = y;
    z = 0;
    speed = 5;
    theta = 0;
    size = 50;
  }

  void render()
    {  
      pushMatrix();
      translate(x,y);
      rotate(theta);
      
      float halfS = size/2;
      stroke(255);
      line(0,0,0-halfS,0+size);
      line(0,0,0+halfS,0+size);
      line(0+halfS,0+size,0,0+halfS);
      line(0-halfS,0+size,0,0+halfS);
      
      popMatrix();
    }
    
    void Update()
    {
      fx = sin(theta);
      fy = -cos(theta);
      if (keyPressed)
      {
        if(keyCode == LEFT)
        {
          theta -= 0.1f;
        }
        if(keyCode == RIGHT)
        {
          theta += 0.1f;
        }
        if(keyCode == UP)
        {
          x += fx*speed;
          y += fy*speed;
        }
        if(keyCode == DOWN)
        {
          x -= fx*speed;
          y -= fy*speed;
        }
      }
    }
}