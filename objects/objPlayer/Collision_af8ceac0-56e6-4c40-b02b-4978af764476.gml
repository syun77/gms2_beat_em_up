// Check to be able to grasp figther.

if(other.side == eSide.Player) {
	// Can't grasp fighter.
	return;
}

// check to hit in range.
var dz = other.z - z;
if(abs(dz) > HIT_RANGE_Z) {
	// no hit.
	return;
}

// check player.
if(state != eState.Standby) {
	// Can't grasp fighter.
	return;
}

// check enemy.
switch(other.state) {
case eState.Dead:
case eState.Knockdown:
case eState.Throw:
	// Can't grasp fighter.
	return;
}

// start to grasp the fighter.
request_grasping        = true;
request_grasped_fighter = other.id;

other.request_grasped   = true;

// adjust grapsed fighter.
if(dir == eDir.Left) {
	other.dir = eDir.Right;
	other.x = x - GRASP_OFFSET_X;
}
else {
	other.dir = eDir.Left;
	other.x = x + GRASP_OFFSET_X;
}
other.z = z + 1;
