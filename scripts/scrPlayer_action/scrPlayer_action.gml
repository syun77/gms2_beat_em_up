var is_punch = argument0;
var is_kick  = argument1;

if(instance_exists(hit_obj_idx) == false) {
	hit_obj_idx = noone;
}

timer++;
var prev_state = state;
var next_attack = eAttackType.None;

if(request_grasped) {
	// start to be grasped.
	request_grasped = false;
	state = eState.Grasped;
}

switch(state) {
case eState.Standby:
	// check to grasp fighter.
	if(request_grasping) {
		// start to grasp the fighter.
		//request_grasping = false;
		state = eState.Grasping;
	}
	else if(is_punch) {
		state = eState.Punch;
		next_attack = eAttackType.Punch;
	}
	else if(is_kick) {
		state = eState.Kick;
		next_attack = eAttackType.Kick;
	}
	break;
	
case eState.Punch:
	if(timer > recovery_frame) {
		state = eState.Standby;
	}
	else if(is_punch) {
		state = eState.Punch2;
		next_attack = eAttackType.Punch;
	}
	break;
	
case eState.Punch2:
	if(timer > recovery_frame) {
		state = eState.Standby;
	}
	else if(is_punch) {
		state = eState.Uppercut;
		next_attack = eAttackType.Uppercut;
	}
	break;
	
case eState.Uppercut:
	if(timer > recovery_frame) {
		state = eState.Standby;
	}
	
case eState.Kick:
	if(timer > recovery_frame) {
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
	
case eState.GraspingKnee:
	if(timer < recovery_frame) {
		break;
	}
	if(is_punch) {
		state = eState.GraspingKnee2;
		next_attack = eAttackType.Knee;
	}
	break;
case eState.GraspingKnee2:
	if(timer < recovery_frame) {
		break;
	}
	if(is_punch) {
		state = eState.GraspingKnee3;
		next_attack = eAttackType.Knee2;
	}
	break;
case eState.GraspingKnee3:
	if(timer > recovery_frame) {
		// end grasping.
		request_grasping = false;
	}
	break;
	
case eState.Grasping:
	if(is_punch) {
		state = eState.GraspingKnee;
		next_attack = eAttackType.Knee;
	}
	break;
	
case eState.Grasped:
	if(request_free_to_grasped_fighter) {
		request_free_to_grasped_fighter = false;
		state = eState.Standby;
	}
	break;
	
case eState.GraspedDamage:
	if(timer > 30) {
		state = eState.Grasped;
	}
	break;
}

// Grasping.
switch(state) {
case eState.Grasping:
case eState.GraspingKnee:
case eState.GraspingKnee2:
case eState.GraspingKnee3:
	if(request_grasping == false) {
		request_grasping = false;
		request_grasped_fighter = noone;
		state = eState.Standby;
	}
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
	recovery_frame =
		  scrAttack_get(next_attack, eAttackProperties.StartupFrame)
		+ scrAttack_get(next_attack, eAttackProperties.ActiveFrame)
		+ scrAttack_get(next_attack, eAttackProperties.RecoveryFrame)
}
