
Ship s;
Ship s1;
float ships = 1;
//ArrayList<FollowMouseShip> fms = new ArrayList<FollowMouseShip>();
FollowMouseShip fms;
ArrayList<Bullet> b = new ArrayList<Bullet>();
void setup()
{
  size(500, 500);
  colorMode(HSB);
  strokeWeight(5);
  s = new Ship();
  s1 = new Ship(200, 300);
  fms = new FollowMouseShip(random(0, width), random(0, height));
  for (int i = 0; i < ships; i++)
  {
    //fms.add( new FollowMouseShip(random(0,width), random(0,height)));
  }
}



void draw()
{
  background(0);
  /*s.Update();
   s.render();
   s1.Update();
   s1.render();
   
   for (int i = 0; i < fms.size(); i ++)
   {
   fms.get(i).Update();
   fms.get(i).render();
   }
   */

  fms.Update();
  fms.render();
  


}