#macro ENEMY_DASH_TIMER       (30) // Drash Frame
#macro ENEMY_RANGE_TO_PLAYER  (32) // Distance closest to the player 
#macro ENEMY_SHIFT_Z_DISTANCE (32)

if(instance_exists(objPlayer) == false) {
	return;
}

var px = objPlayer.x;
var pz = objPlayer.z;

var move_hspeed = 1;
var move_vspeed = 0.5;

var dx = px - x;
var dz = pz - z;

var vx = 0;
var vy = 0;

// to player direction;
var to_dir = eDir.Left;
if(dx < 0) {
	to_dir = eDir.Right;
}

var prev_ai_state = ai_state;
ai_timer++;
switch(ai_state) {
case eAI.Standby:
	switch(to_distance) {
	case eDistance.Nearest:
	case eDistance.Normal:
		// Approach to player.
		ai_state = eAI.CloseTo;
		break;

	case eDistance.Furthest:
		// To turn behind.
		ai_state = eAI.GoAround;
		break;
	}
	break;
}

switch(ai_state) {
case eAI.GoAround:
	// Go around.
	var cnt_left  = objGame.cnt_left;
	var cnt_right = objGame.cnt_right;
	
	// check to move z axis.
	var is_shift_axis = false;
	if(cnt_left == 0 and to_dir == eDir.Right) {
		is_shift_axis = true;
	}
	if(cnt_right == 0 and to_dir == eDir.Left) {
		is_shift_axis = true;
	}
	
	if(is_shift_axis == false) {
		// end to go around.
		ai_state = eAI.CloseTo;
		break;
	}
	
	// move z axis.
	if(abs(dz) < ENEMY_SHIFT_Z_DISTANCE + 8) {
		vy = move_vspeed * 2;
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
	
	if(abs(dz) > ENEMY_SHIFT_Z_DISTANCE) {
		// start to dash.
		ai_state = eAI.Dash;
		if(cnt_left == 0) {
			dir = eDir.Left;
		}
		else {
			dir = eDir.Right;
		}
	}
	break;
	
case eAI.Dash:
	if(dir == eDir.Left) {
		vx = -move_hspeed * 2;
	}
	else {
		vx = move_hspeed * 2;
	}
	if(ai_timer > ENEMY_DASH_TIMER) {
		ai_state = eAI.Standby;
	}
	break;
	
case eAI.CloseTo:
	// Close to player.
	if(dx > ENEMY_RANGE_TO_PLAYER) {
		vx = move_hspeed;
	}
	else if(dx < -ENEMY_RANGE_TO_PLAYER) {
		vx = -move_hspeed;
	}
	else {
		cnt++;
		if(dx > 0) {
			dir = eDir.Right;
		}
		else {
			dir = eDir.Left;
		}
	}
	
	if(dz > HIT_RANGE_Z) {
		vy = move_vspeed;
	}
	else if(dz < -HIT_RANGE_Z) {
		vy = -move_vspeed;
	}
	ai_state = eAI.Standby;
	break;
}

if(prev_ai_state != ai_state) {
	// change ai state.
	ai_timer = 0;
}

scrPlayer_move(vx, vy);
scrPlayer_damage();

var is_punch = false;
var is_kick  = false;

if(cnt == 60) {
	is_punch = true;
	cnt = 0;
}

var is_forward  = false;
var is_backward = false;


scrPlayer_action(is_punch, is_kick, is_forward, is_backward);
