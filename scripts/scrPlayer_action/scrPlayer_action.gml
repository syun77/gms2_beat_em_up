var is_punch = argument0;
var is_kick  = argument1;

if(instance_exists(hit_obj_idx) == false) {
	hit_obj_idx = noone;
}

timer++;
var prev_state   = state;
var prev_hit_obj = hit_obj_idx;

switch(state) {
case eState.Standby:
	if(is_punch) {
		state = eState.Punch;
		hit_obj_idx = scrHit_create2(id, eAttackType.Punch, x, y, z, dir, side);
	}
	else if(is_kick) {
		state = eState.Kick;
		hit_obj_idx = scrHit_create2(id, eAttackType.Kick, x, y, z, dir, side);
	}
	break;
	
case eState.Punch:
	if(timer > 15) {
		state = eState.Standby;
	}
	else if(is_punch) {
		state = eState.Punch2;
		hit_obj_idx = scrHit_create2(id, eAttackType.Punch, x, y, z, dir, side);
	}
	break;
	
case eState.Punch2:
	if(timer > 15) {
		state = eState.Standby;
	}
	else if(is_punch) {
		state = eState.Uppercut;
		hit_obj_idx = scrHit_create2(id, eAttackType.Uppercut, x, y, z, dir, side);
	}
	break;
	
case eState.Uppercut:
	if(timer > 60) {
		state = eState.Standby;
	}
	
case eState.Kick:
	if(timer > 30) {
		state = eState.Standby;
	}
	break;
	
case eState.Damage:
	if(timer > 30) {
		state = eState.Standby;
	}
	break;
	
case eState.Knockdown:
	if(KNOCK_DOWN_RECOVERY_TIME < timer && timer < KNOCK_DOWN_TIME) {
		if(hp <= 0) {
			state = eState.Dead;
		}
	}
	else if(timer > KNOCK_DOWN_TIME) {
		state = eState.Standby;
	}
	break;
	
case eState.Dead:
	if(timer > 40) {
		// kill myself.
		instance_destroy();
	}
	break;
}


// Check to change state.
if(state != prev_state) {
	timer = 0;
}

if(hit_obj_idx != prev_hit_obj) {
	// change hit-box
	if(instance_exists(prev_hit_obj)) {
		// hit-box exists
		with(prev_hit_obj) {
			// kill hit-box
			instance_destroy();
		}
	}
}
