class HScrollbar 
{
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // How fast the button on the slider will move
  boolean over;           
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) 
  {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = 489;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }

  void update() 
  {
    if (overEvent()) 
    {
      over = true;
    } 
    else 
    {
      over = false;
    }
    if (mousePressed && over) 
    {
      locked = true;
    }
    if (!mousePressed) 
    {
      locked = false;
    }
    if (locked) 
    {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) 
    {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) 
  {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() 
  {
    if (mouseX > xpos && mouseX < xpos+swidth && mouseY > ypos && mouseY < ypos+sheight) 
     {
        return true;
     } 
    else 
     {
        return false;
     }
  }

  void display() 
  {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth - 16, sheight);
    ellipse(xpos, ypos + 8, 16, 16);
    ellipse(xpos + swidth-16, ypos + 8, 16, 16);
    if (over || locked) 
    {
      fill(0, 0, 99);
    } 
    else 
    {
      fill(0, 0, 99);
    }
    ellipse(spos, ypos + 8, sheight, sheight);
  }

  float getPos() 
  {
    // Convert spos to be values between 0 and the total width of the scrollbar
    return spos * ratio - 406;
  }
}