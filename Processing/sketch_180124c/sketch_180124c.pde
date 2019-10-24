void setup()
{
  size(500,500);
  stroke(255);
  strokeWeight(2);
  for(int i = 0; i < snowx.length; i ++)
  {
    snowx[i] = random(0,width);
    snowy[i] = random(-height,0);
    snowspeed[i] = random(1,5);
  }
  
}

float[] snowx = new float[100];
float[] snowy = new float[100];
float[] snowspeed = new float[100];

void draw()
{
  background(0);
  fill(255);
  for(int i = 0; i < snowy.length; i++)
  {
    snowy[i] += snowspeed[i];
    line(snowx[i]-5,snowy[i],snowx[i]+5,snowy[i]);
    line(snowx[i],snowy[i]-5,snowx[i],snowy[i]+5);
    line(snowx[i]-5,snowy[i]-5,snowx[i]+5,snowy[i]+5);
    line(snowx[i]-5,snowy[i]-5,snowx[i]+5,snowy[i]+5);
    snowx[i]= snowx[i] + random(-1,1);
    if(snowy[i] >= 501)
    {
      snowy[i] = random(-height,0); 
    }
  }
}