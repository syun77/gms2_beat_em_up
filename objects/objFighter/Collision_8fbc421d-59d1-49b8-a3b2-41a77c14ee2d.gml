/// @description Insert description here
// You can write your code in this editor
switch(state) {
case eState.Knockdown:
case eState.Launch:
case eState.Throw:
	// invincible.
	return;
}

var dz = other.z - z;
if(abs(dz) > 30) {
	// no hit.
	return;
}

if(side != other.side) {
	request_damage_type = other.type;
	
	request_damage      = true;
	request_damage_dir  = other.dir;
}
