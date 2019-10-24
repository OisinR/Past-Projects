import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//Declare all the global variables

ArrayList<Button> ButtonList = new ArrayList<Button>();
ArrayList<Button> StyleList = new ArrayList<Button>();
ArrayList<SongButtons> SongList = new ArrayList<SongButtons>();
float menu = 1;
String song, songName;
PImage img;

HScrollbar colourBar;

Minim minim;
AudioInput ai;
FFT fft;
AudioPlayer player1,player2,player3,pipBoy,pipBoySwitch;
boolean wForm,fastF;

float textX = 87;
float textY = 87;
float sTextX = 80;
float scrollSpeed = 0.67;
float textGap = 110;
float transp = 150;
float bufferY = 170;
float hBarWidth = 40;
boolean pip = false;

float colour = 105.7442;

boolean Grad = true;
float Light = 100;
PFont monofont;

void setup()
  {
   size(1024,600);
   
   //Load the font
   monofont = createFont("monofont.ttf", 100);
   textFont(monofont);
   stroke(0);
   
   //Initialise the buttons
   colorMode(HSB, 360, 100,100);
   fill(colour,99,99);
   textAlign(CENTER);
   ButtonList.add(new Button(480,480,30,30,1, "Visuals", false, 1));
   ButtonList.add(new Button(555,480,30,30,2, "Songs", false, 2 ));
   ButtonList.add(new Button(630,480,30,30,3, "Style", false, 3));
  
   //Load the songs and initialise the song buttons
    minim = new Minim(this);
    player1 = minim.loadFile("Track1.mp3");
    player2 = minim.loadFile("Track2.mp3");
    player3 = minim.loadFile("Track3.mp3");
    pipBoy = minim.loadFile("pipBoyHighlight.wav");
    pipBoySwitch = minim.loadFile("pipBoySwitch.wav");
    ai = minim.getLineIn(Minim.MONO, width, 44100, 16);
    fft = new FFT(width,44100);
    wForm = true;
    fastF = false;
    SongList.add(new SongButtons(309,120,120,30,"Track1.mp3", "Jazzy Interlude", 2));
    SongList.add(new SongButtons(309,180,120,30,"Track3.mp3", "It's All Over But The Crying", 2));
    SongList.add(new SongButtons(309,240,120,30,"Track2.mp3", "American Swing", 2));
    
    SongList.add(new SongButtons(519,120,120,30,"Big Iron.mp3", "Big Iron", 2));
    SongList.add(new SongButtons(519,180,120,30,"Blue Moon.mp3", "Blue Moon", 2));
    SongList.add(new SongButtons(519,240,120,30,"Civilization.mp3", "Civilization", 2));
    
    SongList.add(new SongButtons(729,120,120,30,"Easy Living.mp3", "Easy Living", 2));
    SongList.add(new SongButtons(729,180,120,30,"I dont want to set the world on fire.mp3", "I Don't Want To Set The World On Fire", 2));
    SongList.add(new SongButtons(729,240,120,30,"Heartaches By The Number.mp3", "Heartaches By The Number", 2));
    
    //Set the colour bar
    colourBar = new HScrollbar(389, height/2-30, 360, 16, 5);
    
    //Set the default Song playing in the scrolling text to be blank
    songName = "";
    
    //Initialise the style buttons
    StyleList.add(new Button(409,150,100,20,0, "WaveForm", true, 3));
    StyleList.add(new Button(629,150,100,20,1, "FFT", true, 3 ));
  }
  
void draw()
  {
    //Draw the pipboy 
    drawPipBoy();
   
    //Find which screen to show
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
    
    //Render the screen changing buttons and play the pip sound when mouse over
    for (int i = 0; i < ButtonList.size(); i ++)
     {
       ButtonList.get(i).Update();
         if (pip)
            {
              pip = false;
              pipBoy.pause();
              pipBoy.rewind();
              pipBoy.play();
            }
     }
  }
  
  
  
void menu1()
  {
    //Show the waveform
    fill(colour,99,99, transp);
    rectMode(CENTER);
    if(wForm == true)
      {
      for(int i = 0; i<ai.bufferSize(); i++)
        {
          for(int p = 345; p<793;p+=28)
            {
              float m;
              if(p<241 || p>421)
                  {
                    m = random(100,200);
                  }
              else
                  {
                    m = random(200,300);
                  }
              rect(p,215,20,ai.left.get(i)*m);
            }
        }
      }
      
    //Show the FFT
    fft.window(FFT.HAMMING);
    fft.forward(ai.left);
    if(fastF == true)
      {
      for(int i = 0; i<170; i++)
        {
          stroke(colour,99,99, transp);
          pushMatrix();
          translate(441,215);
          rectMode(CENTER);
          rect(i,0,i,fft.getBand(i)*2);
          rect(i,0,i,fft.getBand(i)*-2);
          popMatrix();
        }
      }
   rectMode(CORNER);
  }
  
void menu2()
  {
    //Render and play sounds for the song buttons
    for (int i = 0; i < SongList.size(); i ++)
     {
       SongList.get(i).Update();
       if (pip)
          {
            pip = false;
            pipBoy.pause();
            pipBoy.rewind();
            pipBoy.play();
          }
     }
  }
  
void menu3()
  {
    //Render and play sounds for the Style buttons 
    for (int i = 0; i < StyleList.size(); i ++)
     {
       StyleList.get(i).Update();
       if (pip)
          {
            pip = false;
            pipBoy.pause();
            pipBoy.rewind();
            pipBoy.play();
          }
     }
    //Render and show the colour selector
    rectMode(CORNER);
    colour = colourBar.getPos();
    fill(colour,99,99);
    colourBar.update();
    colourBar.display(); 
  }


void textScroll()
  {
    //Make the song title scroll across the screen
    text(songName,sTextX,320);
    if(sTextX<1024)
      {
        sTextX = sTextX+scrollSpeed;
        if(sTextX>=1024)
          {
            sTextX = 80;
          }
      }
  }

void mouseReleased()
  {
   //Give the buttons actual interactivity 
   for (int i = 0; i < ButtonList.size(); i ++)
     {
       //Check to see if the buttons are on the right screen, so they cant be pressed even when not shown
       if(ButtonList.get(i).menub == menu) 
       {
         if(mouseX>ButtonList.get(i).x && mouseX <ButtonList.get(i).x+ButtonList.get(i).w && mouseY>ButtonList.get(i).y && mouseY <ButtonList.get(i).y+ButtonList.get(i).h)
           {
             if( ButtonList.get(i).menub == menu)
             {
                menu = ButtonList.get(i).number;
                pipBoySwitch.pause();
                pipBoySwitch.rewind();
                pipBoySwitch.play();
             }
           } 
       }
       else
       {
         //same thing but for the round buttons
         float d = dist(ButtonList.get(i).x, ButtonList.get(i).y, mouseX, mouseY);
         if (d < 15)
         {
              menu = ButtonList.get(i).number;
              pipBoySwitch.pause();
              pipBoySwitch.rewind();
              pipBoySwitch.play();
         }
       }
     }
  for (int i = 0; i < SongList.size(); i ++)
     {
       //Song buttons
       if(mouseX>SongList.get(i).x && mouseX <SongList.get(i).x+SongList.get(i).w && mouseY>SongList.get(i).y && mouseY <SongList.get(i).y+SongList.get(i).h)
         {
           if( SongList.get(i).menub == menu)
           {
              song = SongList.get(i).name;
              songName = SongList.get(i).buttonText;
              player1.pause();
              player1 = minim.loadFile(song);
              player1.play();
              pipBoySwitch.pause();
              pipBoySwitch.rewind();
              pipBoySwitch.play();
           }
         }    
     }
    for (int i = 0; i < StyleList.size(); i ++)
     {
       //Style buttons
      if(StyleList.get(i).menub == menu)
       {
       if(mouseX>StyleList.get(i).x && mouseX <StyleList.get(i).x+StyleList.get(i).w && mouseY>StyleList.get(i).y && mouseY <StyleList.get(i).y+StyleList.get(i).h)
         {
            if (StyleList.get(i).number == 0)
            {
              wForm = true;
              fastF = false;
            }
            if (StyleList.get(i).number == 1)
            {
              wForm = false;
              fastF = true;            
            }
            pipBoySwitch.pause();
            pipBoySwitch.rewind();
            pipBoySwitch.play();
         } 
       }
     }
  }
  
void drawPipBoy()
{
   textScroll();
   colorMode(RGB, 255, 255, 255);
   stroke(0);
   
   // pip-boy green colour 
   background(19, 25, 21);
 
   //Screw 1
   pushStyle();
   rectMode(CENTER);
   fill(27, 42, 37);
   rect(220, 90, 50, 50, 10);
   popStyle();
 
   //geiger counter 
   fill(28, 37, 34);
   ellipse(100, 85, 100, 100);
   fill(177, 199, 150);
   ellipse(100, 85, 80, 80);
   fill(28, 37, 34);
   arc(100, 85, 80, 80, radians(90), radians(180));
   arc(100, 85, 80, 80, radians(90), radians(270));
   line(100, 125, 100, 45);
   fill(182, 205, 151);
   arc(100, 85, 80, 80, radians(90), radians(90));
   arc(100, 85, 80, 80, radians(360), radians(90));
   line(100, 125, 100, 45);

   //screen border
   fill(26, 32, 28);
   rect(230, 20, 668, 465, 30);
   
   //Visualiser Screen
   fill(0, 0, 0);
   rect(245, 25, 625, 445, 30);
   rect(245, 25, 648, 445, 30);
   
   //fiddleing to make the text scroll seem smooth
   colorMode(HSB, 360, 100,100);
   fill(colour,99,99, transp);
   stroke(colour,99,99, transp);
   line(246,100,891,100);
   rect(246,300,643,30);
   noStroke();
   textScroll();
   colorMode(RGB, 255, 255, 255);
   fill(19, 25, 21);
   rect(0,200,229,200);
   fill(26, 32, 28);
   rect(230,145,15, 275, 30);
   stroke(0);
      
   //Buttons underlighting
   pushStyle();
   noStroke();
   fill(19, 25, 21);
   rect(890, 155, 360, 180, 7);
   popStyle();
   pushStyle();
   noStroke();
   fill(19, 25, 21);
   rect(379, 410, 360, 130, 7);
   popStyle(); 
 
   //grill 1
   line(0, 165, 185, 165);
   line(0, 170, 175, 170);
   line(185, 165, 175, 170);
   line(0, 330, 185, 330);
   line(0, 325, 175, 325);
   line(175, 325, 185, 330);
   line(175, 170, 175, 325);
   line(185, 165, 185, 330);
   fill(36, 54, 33);
   rect(190, 140, 45, 220);
   fill(7, 9, 6);
   rect(0, 200, 175, 10);
   rect(0, 230, 175, 10);
   rect(0, 260, 175, 10);
   rect(0, 290, 175, 10);
 
   //side dial
   fill(16, 21, 17);
   rect(45, 305, 85, 20);
   fill(32, 43, 39);
   rect(195, 165, 35, 180);
   fill(50, 66, 48);
   rect(200, 175, 25, 160, 7);
 
   //switch
   fill(27, 42, 37);
   ellipse(90, 400, 110, 110);
   arc(90, 400, 160, 120, 0, PI);
   fill(63, 63, 52);
   ellipse(90, 395, 70, 70);
   fill(13, 18, 13);
   ellipse(90, 490, 30, 30);
   fill(37, 55, 51);
   ellipse(90, 490, 20, 20);
   fill(13, 18, 13);
   ellipse(950, 465, 30, 30);
   fill(37, 55, 51);
   ellipse(950, 465, 20, 20);
   fill(13, 18, 13);
   ellipse(950, 125, 30, 30);
   fill(37, 55, 51);
   ellipse(950, 125, 20, 20);
   ellipse(220, 90, 40, 40);
   fill(13, 18, 13);
   ellipse(210, 475, 30, 30);
   fill(37, 55, 51);
   ellipse(210, 475, 20, 20);
 
   //button board detail 1
   line(231, 438, 195, 455);
   line(195, 455, 189, 464);
   line(189, 464, 185, 474);
   line(185, 474, 188, 490);
   line(188, 490, 204, 499);
   line(204, 499, 212, 500);
   line(212, 500, 257, 491);
   line(257, 491, 274, 494);
   line(274, 494, 380, 500);
   line(380, 500, 390, 550);
   line(390, 550, 405, 550);
   line(405, 550, 400, 485);
   line(400, 485, 395, 415);
   line(395, 415, 403, 411);
   line(403, 411, 384, 411);
   line(384, 411, 380, 420);
   line(380, 420, 377, 486);
   line(377, 486, 380, 500);
   line(274, 494, 274, 506);
   line(274, 506, 288, 525);
   line(288, 525, 305, 600);
   line(408, 531, 707, 537);
   line(707, 537, 714, 426);
   line(714, 426, 400, 426);
   line(714, 426, 710, 417);
   line(710, 417, 404, 417);
   line(408, 531, 400, 426);
   line(400, 426, 405, 417);
   line(421, 531, 437, 600);
   line(684, 536, 686, 600);
 
   //grill 2
   fill(7, 9, 6);
   rect(460, 532, 17, 90);
   rect(520, 533, 17, 90);
   rect(576, 535, 17, 90);
   rect(630, 536, 17, 90);
 
   //buttons
   fill(37, 52, 51);
   ellipse( 480, 480, 60, 60);
   fill(179, 85, 25);
   ellipse(480, 480, 30, 30);
   fill(37, 52, 51);
   ellipse(555, 480, 60, 60);
   fill(179, 85, 25);
   ellipse(555, 480, 30, 30);
   fill(37, 52, 51);
   ellipse(630, 480, 60, 60);
   fill(179, 85, 25);
   ellipse(630, 480, 30, 30);
 
   // button board detail 2
   line(720, 550, 730, 550);
   line(720, 550, 710, 600);
   line(730, 550, 720, 415);
   line(720, 415, 710, 410);
   line(710, 410, 730, 410);
   line(730, 410, 735, 415);
   line(735, 415, 740, 480);
   line(740, 480, 740, 550);
   line(730, 550, 740, 550);
   line(740, 535, 780, 495);
   line(780, 495, 1024, 495);
   line(890, 155, 1024, 155);
   line(890, 155, 895, 330);
   line(895, 330, 1024, 330);
   line(890, 165, 1024, 165);
   line(896, 320, 1024, 320);
 
   //grill 3
   fill(7, 9, 6);
   rect(893, 195, 1024, 10);
   rect(893, 225, 1024, 10);
   rect(893, 255, 1024, 10);
   rect(893, 285, 1024, 10);
 
   //Text 
   textAlign(CORNER);
   fill(190, 235, 0); 
   textSize(20);
   text("VISUALS", 453, 445);                                            
   text("SONGS", 536, 445);                                    
   text("STYLE", 611, 445);                                        
   pushStyle();
   fill(27, 42, 37);
   textSize(18);   
   text("Model 3000", 52, 320);
   textSize(30); 
   text("Pip-Boy", 48, 193);
   popStyle();
 
   textAlign(CENTER);    
   colorMode(HSB, 360, 100,100);   
}

  
  
  
  