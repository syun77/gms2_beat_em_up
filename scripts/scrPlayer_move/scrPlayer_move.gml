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
var z_min = -64 - BASE_Z_TO_Y;
var z_max = 64  - BASE_Z_TO_Y;
z = median(z_min, z, z_max);
depth = z - 100;


// ===========================================
// process to damage
if(request_damage_type == eAttackType.None) {
	// not any damage.
	return;
}

var type = request_damage_type;
request_damage_type = eAttackType.None;

// start to damage.
state = eState.Damage;
timer = 0;
if(request_damage_dir == eDir.Left) {
	dir = eDir.Right;
}
else {
	dir = eDir.Left;
}

// damage
var damage = scrAttack_get(type, eAttackProperties.Power);
hp -= damage;
if(hp < 0) {
	hp = 0;
}

// check to launch
var launch = scrAttack_get(type, eAttackProperties.LaunchOfPower);
if(launch > 0) {
	// start to launch
	state = eState.Launch;
	vspeed = -7 * launch * 0.1;
	hspeed = 3 * launch * 0.1;
	if(dir == eDir.Right) {
		hspeed *= -1;
	}
}
