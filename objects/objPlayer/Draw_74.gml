/// @description Insert description here
// You can write your code in this editor
if(debug_draw_hit_idx) {
	var px = 8;
	var py = 100;

	for(var i = 0; i < MAX_HIT_OBJECTS; i++) {
		draw_text(px, py, "[" + string(i) + "]" + string(already_hit_idx[i]));
		py += 16;
	}
}

if(debug_draw_hit_idx) {
	var px = 300;
	var py = 100;
	var idx = 0;
	with(objHit)
	{
		draw_text(px, py, "[" + string(idx) + "]" + string(id));
		idx++;
		py += 16;
	}
}
