float x = 10;
float y = 10;
float w = 100;
float h = 20;

Button button,button2,button3;

void setup()
{
 size(500,500);
 //background(255);
 stroke(0);
 fill(0);
 button = new Button(10,10,100,20,1);
 button2 = new Button(120,10,100,20,2);
 button3 = new Button(230,10,100,20,3);
}

void draw()
{
  background(255,0,0);
  button.Update();
  button2.Update();
  button3.Update();
  fill(0);
  

}


  void MouseReleased()
  {
    print("asda");
    if(mouseX>button.x && mouseX <button.x+button.w && mouseY>button.y && mouseY <button.y+button.h)
         {
          println(button.number);
          //do stuff 
         } 
    
    
    
  }