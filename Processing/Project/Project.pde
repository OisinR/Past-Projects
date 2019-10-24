void setup()
{
  size(500,500);
  bugWidth = 50;
  bugHeight = 50;
  playerWidth = 50;
  playerHeight = 50;
  halfBug = bugWidth/2;
  bugX = random(halfBug, width - halfBug);
  bugY = bugHeight *2;
  
  cx = width/2;
  cy = height/2;
  
  playerX = cx;
  playerY = (height - playerHeight * 2);
  
}

void drawBug()
{
  bugX = 250;
  bugY =150;
  line(bugX,bugY-bugHeight/2,bugX-bugHeight/2,bugY+bugHeight/2);
  line(bugX,bugY-bugHeight/2,bugX+bugWidth/2,bugY+bugHeight/2);
  line(bugX-bugWidth/2,bugY+bugHeight/2,bugX,bugY);
  line(bugX+bugWidth/2,bugY+bugHeight/2,bugX,bugY);
}

void drawPlayer()
{
  playerX = 250;
  playerY = 450;
  line(playerX-playerWidth/2,playerHeight,playerWidth+playerWidth/2,playerHeight);
  line(playerX-playerHeight/2,playerY - playerHeight + playerHeight/2,playerX-playerHeight/2,playerHeight);
  line(playerX+playerHeight/2,playerY - playerHeight + playerHeight/2,playerX+playerHeight/2,playerHeight);
  line(playerX+playerHeight/2,playerY - playerHeight + playerHeight/2,playerX+ playerWidth/2 -playerWidth/4,playerY-playerHeight/2);
  //line(playerX,playerY,playerX,playerY);
}


float bugX, bugY;
float playerX,playerY;
int score;
float cx,cy;
float bugWidth,bugHeight;
float playerWidth,playerHeight;
float halfBug;


void draw()
{
  background(0);
  stroke(255);
  strokeWeight(2);
  drawBug();
  drawPlayer();
}