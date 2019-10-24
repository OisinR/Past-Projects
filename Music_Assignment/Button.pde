class Button
{ 
  //Variables
  float x,y,w,h,number, menub;
  boolean pipsnd, rect;
  String buttonText;
  Button(float x, float y, float w, float h, float number, String text, boolean rect, float menub)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.number = number;
    this.buttonText = text;
    this.rect = rect;
    this.menub = menub;
  }
  
  void Update()
  {
    //If a rectangle
    if(rect)
    {
        stroke(0);
        strokeWeight(2);
        fill(colour,99,99);
        if(mousePressed)
        {
           if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h)
           {   
             //change colour if clicked but not released
            fill(colour,99,99);
           }
        }
        if(overButton())
        {
          rect(x-5,y-5,w+10,h+10);
          fill(0,0,2);
          rect(x,y,w,h);
          stroke(colour,99,99);
          textSize(20);
          fill(0,0,99);
          text(buttonText,x,y,w,h);
          //Play a sound only once
          if (pipsnd)
            {
               pip = true;
               pipsnd = false;
            }
        }
        else
        {     
          rect(x-4,y-4,w+8,h+8);
          fill(0,0,2);
          rect(x,y,w,h);
          textSize(20);
          fill(colour,99,99);
          text(buttonText,x,y,w,h);
          //reset sound
          pip = false;
          pipsnd = true;
        }
        noStroke();
      
    }
      else
      //If round
      {
        if(this.menub == menu)
        {
          fill(360,99,99);
        }
        else
        {
          stroke(0);
          strokeWeight(2);
          fill(29,99,98);
        }
        float d = dist(x, y, mouseX, mouseY);
        if(mousePressed)
        {
           if(d < 15)
           {       
            fill(360,99,99);
           }
        }  
        stroke(0);
        ellipse(x,y,w,h);
        pip = false;
        pipsnd = true;
        noStroke();
      }
    }
  
//If you hover over the button
boolean overButton() 
{
  if (rect)
  {
    if (mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h) 
      {
        return true;
      } 
    else 
      {
        return false;
      }
  }
  else
  {
     float d = dist(x, y, mouseX, mouseY);
     if(d < 15)
      {
        return true;
      }
     else
     {
       return false;
     }
       
  }
}
  

}