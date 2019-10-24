import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


Button button,button2,button3;
ArrayList<Button> ButtonList = new ArrayList<Button>();
float menu = 1;
PImage img;

Minim minim;
AudioInput ai;
AudioPlayer player1,player2,player3,pipBoy,pipBoySwitch;
//SoundFile pipBoy;

float textX = 87;
float textY = 87;
float textGap = 110;
float transp = 150;
float hBarWidth = 40;
boolean pip = false, notPlayed = true;

void setup()
{
 size(800,450);
 stroke(0);
 fill(76,195,63);
 textAlign(CENTER);
 ButtonList.add(new Button(166,70,100,20,1, "Vis"));
 ButtonList.add(new Button(276,70,100,20,2, "Songs"));
 ButtonList.add(new Button(386,70,100,20,3, "Style"));
 img = loadImage("pip-boy-ref.png");

  minim = new Minim(this);
  player1 = minim.loadFile("Track1.mp3");
  player2 = minim.loadFile("Track2.mp3");
  player3 = minim.loadFile("Track3.mp3");
  pipBoy = minim.loadFile("pipBoyHighlight.wav");
  pipBoySwitch = minim.loadFile("pipBoySwitch.wav");
  ai = minim.getLineIn(Minim.MONO, width, 44100, 16);
  
  player1.play();
}

void draw()
{
  //print(mouseX + "," + mouseY + "\n");
  background(0);

  if(menu == 1)
  {
    menu1();
  }
  else if(menu == 2)
  {
    menu2();
  }
  else if(menu == 3)
  {
    menu3();
  }

  for (int i = 0; i < ButtonList.size(); i ++)
   {
     ButtonList.get(i).Update();
     if (pip)
        {
          pip = false;
          if(notPlayed)
            {
              pipBoy.pause();
              pipBoy.rewind();
              pipBoy.play();
              notPlayed = false;            
            }

        }
   }
   if(!ButtonList.get(0).overButton() && !ButtonList.get(1).overButton() && !ButtonList.get(2).overButton())
      {
        notPlayed = true;
      }
  fill(0);
  image(img, 0, 0);

}

void menu1()
{
  //fill(255,0,0);
  //rect(140,54,390,300); 
  fill(62,255,155,transp);
  rectMode(CENTER);
  for(int i = 0; i<ai.bufferSize(); i++)
    {
      for(int p = 176; p<486;p+=28)
        {
          float m = random(200,400);
          rect(p,235,20,ai.left.get(i)*m);
        }
    }
  rectMode(CORNER);
  stroke(62,255,255,transp);
  line(20,100,600,100);
  rect(120,300,400,30);
  textScroll();
}


void menu2()
{
  //fill(0,255,0);
  //rect(140,54,390,300);
  fill(62,255,155,transp);
  rectMode(CENTER);
  
  
  rectMode(CORNER);
  stroke(62,255,255,transp);
  line(20,100,600,100);
  rect(120,300,400,30);
  textScroll();
}

void menu3()
{
  //fill(0,0,255);
  //rect(140,54,390,300);
  fill(62,255,155,transp);
  rectMode(CENTER);
  
  
  rectMode(CORNER);
  stroke(62,255,255,transp);
  line(20,100,600,100);
  rect(120,300,400,30);
  textScroll();
}


void textScroll()
{
  //Make the song title scroll across the screen
  
}

  void mouseReleased()
  {
   for (int i = 0; i < ButtonList.size(); i ++)
     {
       if(mouseX>ButtonList.get(i).x && mouseX <ButtonList.get(i).x+ButtonList.get(i).w && mouseY>ButtonList.get(i).y && mouseY <ButtonList.get(i).y+ButtonList.get(i).h)
         {
          menu = ButtonList.get(i).number;
          pipBoySwitch.pause();
          pipBoySwitch.rewind();
          pipBoySwitch.play();
         }    
     }    
  }
