with(objFighter) {
	for(var i = 0; i < MAX_HIT_OBJECTS; i++) {
		if(already_hit_idx[i] == other.id) {
			already_hit_idx[i] = noone;
			break;
		}
	}
}