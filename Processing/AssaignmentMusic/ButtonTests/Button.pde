class Button
{
  
  float x,y,w,h,number;
  String buttonText;
  Button(float x, float y, float w, float h, float number, String text)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.number = number;
    this.buttonText = text;
  }
  
  void Update()
  {
    stroke(0);
    strokeWeight(2);
    fill(76,195,63);
    if(mousePressed)
    {
       if(mouseX>x && mouseX <x+w && mouseY>y && mouseY <y+h)
       {       
        fill(79,230,63); 
       }
    }
    if(overButton())
    {
      rect(x-5,y-5,w+10,h+10);
      textSize(15);
      fill(255);
      text(buttonText,x,y,w,h);
      pip = true;
    }
    else
    {      
      rect(x,y,w,h);
      textSize(15);
      fill(255);
      text(buttonText,x,y,w,h);
      pip = false;
      
    }
    noStroke();
  }

boolean overButton() 
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
  

}
