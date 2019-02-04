// process to move
var vx = argument0;
var vy = argument1;


switch(state) {
case eState.Standby:
	hspeed = vx;
	z += vy;
	if(vx < 0) {
		dir = eDir.Left;
	}
	else if(vx > 0) {
		dir = eDir.Right;
	}
	
	break;
	
case eState.Launch:
case eState.Throw:
	hspeed *= 0.97;
	vspeed += 0.3;
	if(y > 0) {
		y = 0;
		if(speed > 3) {
			vspeed *= -0.3;
		}
		else {
			speed = 0;
			timer = 0;
			state = eState.Knockdown;
		}
	}
	break;
	
default:
	hspeed = 0;
	break;
}

x = median(32, x, room_width-32);
z = median(MIN_Z, z, MAX_Z);
depth = z - 100;
