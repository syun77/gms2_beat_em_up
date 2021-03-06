// process to damage
if(request_damage_type == eAttackType.None) {
	// Not need to check.
	return;
}

request_grasping = false;
if(request_grasped_fighter != noone) {
	request_grasped_fighter.request_free_to_grasped_fighter = true;
	request_grasped_fighter = noone;
}

var type = request_damage_type;
request_damage_type = eAttackType.None;

// start to damage.
switch(state) {
case eState.Grasped:
case eState.GraspedDamage:
	state = eState.GraspedDamage;
	break;
	
default:
	state = eState.Damage;
	break;
}
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
if(launch == 0 && hp <= 0) {
	// Dead.
	launch = 5;
}

if(launch > 0) {
	// start to launch
	state = eState.Launch;
	if(hp <= 0) {
		launch *= 1.5;
	}
	vspeed = -7 * launch * 0.1;
	hspeed = 3 * launch * 0.1;
	if(dir == eDir.Right) {
		hspeed *= -1;
	}
}

if(side == eSide.Enemy) {
	// Display HUD.
	objHUD.enemy_id = id;
}
