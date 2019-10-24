class SongButtons
{
  
  float x,y,w,h, menub;
  boolean pipsnd;
  String buttonText,name;
  SongButtons(float x, float y, float w, float h, String name, String text, float menub)
  {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.name = name;
    this.buttonText = text;
    this.menub = menub;
  }
  
  void Update()
  {
    //Render and play sounds for the song buttons
    if(menu == 2)
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
  }

//If you hover over the button
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