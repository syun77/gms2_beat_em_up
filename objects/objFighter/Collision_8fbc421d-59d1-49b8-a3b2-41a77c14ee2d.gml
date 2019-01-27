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
if(abs(dz) > 16) {
	// no hit.
	return;
}

if(side == other.side) {
	// self
	return;
}

var is_find = false;
for(var i = 0; i < MAX_HIT_OBJECTS; i++) {
	var idx = already_hit_idx[i];
	if(idx == other.id) {
		is_find = true;
		break;
	}
}

if(is_find == false) {
	for(var i = 0; i < MAX_HIT_OBJECTS; i++) {
		if(already_hit_idx[i] == noone) {
			already_hit_idx[i] = other.id;
			request_damage_type = other.type;
			request_damage_dir  = other.dir;
			break;
		}
	}
}
