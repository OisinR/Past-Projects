class Button
{
  
  float x,y,w,h,number;
  
  Button(float x, float y, float w, float h, float number)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.number = number;
  }
  
  void Update()
  {
    
    if(mousePressed)
    {
       if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h)
       {
       
        fill(255);
        //do stuff 
       }
    }

    rect(x,y,w,h);
    fill(0);
  }

  
  

}