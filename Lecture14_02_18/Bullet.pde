class Bullet
{
  
  float x,y,z,speed,theta,size,fx,fy;
   Bullet(float x, float y)
   {
     this.x = x;
     this.y = y;
     
   }

   void showBullets()
   {
    line(this.x,this.y,mouseX,mouseY); 
   }


   void Update()
   {
      fx = sin(theta);
      fy = -cos(theta);
      x += fx;
      y += fy;
     
   }
}