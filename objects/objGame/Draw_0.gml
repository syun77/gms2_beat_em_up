/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if(instance_exists(objPlayer) == false) {
	return;
}
if(is_finish == false) {
	return;
}

var px = objPlayer.x;
var py = -objPlayer.z - objPlayer.sprite_height/2;

var t = 0;
if(timer%16 < 8) {
	t = 1;
}
var divide = 32;
var length = room_width * 1.5;
for(var i = 0; i < divide; i++) {
	var r1 = 360 / divide * (i);
	var r2 = 360 / divide * (i+1);
	var rad1 = degtorad(r1);
	var rad2 = degtorad(r2);
	var x1 = px + length * cos(rad1);
	var y1 = py + length * sin(rad1);
	var x2 = px + length * cos(rad2);
	var y2 = py + length * sin(rad2);
	var col = c_red;
	if(i%2 == t) {
		col = c_yellow;
	}
	
	draw_set_color(col);
	draw_triangle(px, py, x1, y1, x2, y2, false);
}
