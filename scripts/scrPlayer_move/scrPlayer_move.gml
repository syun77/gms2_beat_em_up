// move
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
		speed = 0;
		timer = 0;
		state = eState.Knockdown;
	}
	break;
	
default:
	hspeed = 0;
	break;
}

x = median(32, x, room_width-32);
var z_min = -64 - 384;
var z_max = 64  - 384;
z = median(z_min, z, z_max);
depth = z - 100;

// ===========================================
if(request_damage) {
	state = eState.Damage;
	timer = 0;
	request_damage = false;
	if(request_damage_dir == eDir.Left) {
		dir = eDir.Right;
	}
	else {
		dir = eDir.Left;
	}
	var launch = scrAttack_get(request_damage_type, eAttackProperties.LaunchOfPower);
	if(launch > 0) {
		state = eState.Launch;
		vspeed = -7 * launch * 0.1;
		hspeed = 3 * launch * 0.1;
		if(dir == eDir.Right) {
			hspeed *= -1;
		}
	}
}
