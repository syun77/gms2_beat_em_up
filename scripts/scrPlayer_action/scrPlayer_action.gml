var is_punch = argument0;
var is_kick  = argument1;

timer++;
var prevState = state;

switch(state) {
case eState.Standby:
	if(is_punch) {
		state = eState.Punch;
		scrHit_create2(eAttackType.Punch, x, y, z, dir, side);
	}
	else if(is_kick) {
		state = eState.Kick;
		scrHit_create2(eAttackType.Kick, x, y, z, dir, side);
	}
	break;
	
case eState.Punch:
	if(timer > 15) {
		state = eState.Standby;
	}
	else if(is_punch) {
		state = eState.Punch2;
		scrHit_create2(eAttackType.Punch, x, y, z, dir, side);
	}
	break;
	
case eState.Punch2:
	if(timer > 15) {
		state = eState.Standby;
	}
	else if(is_punch) {
		state = eState.Uppercut;
		scrHit_create2(eAttackType.Uppercut, x, y, z, dir, side);
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
		instance_destroy();
	}
	break;
}


// Check to change state.
if(state != prevState) {
	timer = 0;
}
