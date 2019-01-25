var is_punch = argument0;
var is_kick  = argument1;

timer++;
switch(state) {
case eState.Standby:
	if(is_punch) {
		state = eState.Punch;
		timer = 0;
		scrHit_create2(eAttackType.Punch, x, y, z, dir, side);
	}
	else if(is_kick) {
		state = eState.Kick;
		timer = 0;
		scrHit_create2(eAttackType.Kick, x, y, z, dir, side);
	}
	break;
	
case eState.Punch:
	if(timer > 15) {
		state = eState.Standby;
		timer = 0;
	}
	else if(is_punch) {
		state = eState.Punch2;
		timer = 0;
		scrHit_create2(eAttackType.Punch, x, y, z, dir, side);
	}
	break;
	
case eState.Punch2:
	if(timer > 15) {
		state = eState.Standby;
		timer = 0;
	}
	else if(is_punch) {
		state = eState.Uppercut;
		timer = 0;
		scrHit_create2(eAttackType.Uppercut, x, y, z, dir, side);
	}
	break;
	
case eState.Uppercut:
	if(timer > 60) {
		state = eState.Standby;
		timer = 0;
	}
	
case eState.Kick:
	if(timer > 30) {
		state = eState.Standby;
		timer = 0;
	}
	break;
	
case eState.Damage:
	if(timer > 30) {
		state = eState.Standby;
		timer = 0;
	}
	break;
	
case eState.Knockdown:
	if(timer > 60) {
		state = eState.Standby;
		timer = 0;
	}
}

