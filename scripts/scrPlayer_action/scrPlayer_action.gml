var is_punch = argument0;
var is_kick  = argument1;

if(instance_exists(hit_obj_idx) == false) {
	hit_obj_idx = noone;
}

timer++;
var prev_state = state;
var next_attack = eAttackType.None;

switch(state) {
case eState.Standby:
	if(is_punch) {
		state = eState.Punch;
		next_attack = eAttackType.Punch;
	}
	else if(is_kick) {
		state = eState.Kick;
		next_attack = eAttackType.Kick;
	}
	break;
	
case eState.Punch:
	if(timer > 15) {
		state = eState.Standby;
	}
	else if(is_punch) {
		state = eState.Punch2;
		next_attack = eAttackType.Punch;
	}
	break;
	
case eState.Punch2:
	if(timer > 15) {
		state = eState.Standby;
	}
	else if(is_punch) {
		state = eState.Uppercut;
		next_attack = eAttackType.Uppercut;
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
	// change hit-box
	if(instance_exists(hit_obj_idx)) {
		// hit-box exists
		with(hit_obj_idx) {
			// kill hit-box
			instance_destroy();
		}
		hit_obj_idx = noone;
	}
}

if(next_attack != eAttackType.None) {
	// start to attack.
	hit_obj_idx = scrHit_create2(id, next_attack, x, y, z, dir, side);	
}
