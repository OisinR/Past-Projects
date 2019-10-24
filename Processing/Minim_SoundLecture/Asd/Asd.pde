void setup()
{
  size(500,500);
}

  float yy = 250;
  float yyy = 250;

void draw()
{
  background(0);
  yy += random(-5,5);
  println(yy);
  ellipse(350,yy,50,50);
  yyy = lerp(yyy, yyy+30, 5);
  println(yyy);
  ellipse(250,yyy,50,50); //moves 10% closer to yyy every frame 
}