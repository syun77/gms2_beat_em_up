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
	if(timer > KNOCK_DOWN_RECOVERY_TIME) {
		ofs_x = random_range(-3, 3);
	}
	break;
	
case eState.Launch:
case eState.Throw:
case eState.Dead:
	image_no = 6;
	break;
	
case eState.Grasping:
	image_no = 7;
	break;
	
case eState.GraspingKnee:
case eState.GraspingKnee2:
	image_no = 7;
	if(timer < 15) {
		image_no = 9;
	}
	break;
case eState.GraspingKnee3:
	image_no = 9;
	break;
	
case eState.Grasped:
	image_no = 8;
	break;
	
case eState.GraspedDamage:
	image_no = 8;
	ofs_x = (30-timer) / 5.0 * random_range(-1, 1);
	break;
}

if(state == eState.Dead) {
	if(timer%4 < 2) {
		// blink
		return;
	}
}

var px = x + ofs_x;
var py = y;
py += -1 * z;
var scale_x = 1;
if(dir == eDir.Left) {
	scale_x = -1;
}
draw_sprite_ext(sprite_index, image_no, px, py, scale_x, 1, 0, c_white, 1);
