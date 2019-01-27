/// @description Insert description here
// You can write your code in this editor
if(instance_exists(objPlayer) == false) {
	return;
}

var px = objPlayer.x;
var pz = objPlayer.z;

var move_hspeed = 1;
var move_vspeed = 0.5;
var near_distance = 32;

var dx = px - x;
var dz = pz - z;

var vx = 0;
var vy = 0;

if(to_distance == eDistance.Furthest) {
	// Go around.
	var cnt_left = 0;
	with(objEnemy) {
		var dx2 = px - x;
		if(dx2 > 0) {
			cnt_left++;
		}
	}
	if(cnt_left == 0) {
		if(abs(dz) < 32) {
			vy = move_vspeed;
		}
		if(dz == 0) {
			if(pz == MAX_Z) {
				// Bottom.
				vy *= -1;
			}
			else {
				// Upper.
				vy *= 1;
			}
		}
		else {
			vy *= -1 * sign(dz);
		}
	}
}
else {
	// Close to player.
	if(dx > near_distance) {
		vx = move_hspeed;
	}
	else if(dx < -near_distance) {
		vx = -move_hspeed;
	}
	if(dz > 16) {
		vy = move_vspeed;
	}
	else if(dz < -16) {
		vy = -move_vspeed;
	}
}

scrPlayer_move(vx, vy);
scrPlayer_damage();

var is_punch = false;
var is_kick  = false;

cnt++;
if(cnt%120 == 0) {
	is_punch = true;
}

scrPlayer_action(is_punch, is_kick);
