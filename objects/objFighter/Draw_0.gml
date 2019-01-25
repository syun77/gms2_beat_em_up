/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
var image_no = 0;
var ofs_x = 0;
switch(state) {
case eState.Standby:
	image_no = 0;
	if(timer%60 < 30) {
		image_no = 1;
	}
	break;
	
case eState.Punch:
case eState.Punch2:
	image_no = 2;
	break;
	
case eState.Kick:
	image_no = 3;
	break;
	
case eState.Uppercut:
	image_no = 4;
	break;
	
case eState.Damage:
	image_no = 5;
	ofs_x = (30-timer) / 5.0 * random_range(-1, 1);
	break;
	
case eState.Knockdown:
	image_no = 6;
	if(timer > 40) {
		ofs_x = random_range(-3, 3);
	}
	break;
	
case eState.Launch:
case eState.Throw:
	image_no = 6;
	break;
}

var px = x + ofs_x;
var py = y;
py += -1 * z;
var scale_x = 1;
if(dir == eDir.Left) {
	scale_x = -1;
}
draw_sprite_ext(sprite_index, image_no, px, py, scale_x, 1, 0, c_white, 1);
