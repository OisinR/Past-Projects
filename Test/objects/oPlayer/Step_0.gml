/// @description Insert description here
// You can write your code in this editor
key_left = keyboard_check(vk_left);
key_right = keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_control = keyboard_check_pressed(vk_control);



if !alarm[0]
{
var move = key_right - key_left;

hsp = move * walksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,oWall)) && (key_jump)
{
	vsp = -7;
	
}

if (place_meeting(x + hsp,y,oWall))
{
	while (!place_meeting(x + sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	
	hsp = 0;
	
}

x  = x + hsp;

if (place_meeting(x,y + vsp,oWall))
{
	while (!place_meeting(x,y + sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	
	vsp = 0;
	
}

y  = y + vsp;
}




if (place_meeting(x,y+2,oWall)) && (key_control) && !alarm[0]
{
  if move = 1
  hsp = dashspeed;
   else
    hsp = -dashspeed;
  alarm[0]=20;
}
