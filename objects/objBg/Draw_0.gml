/// @description Insert description here
// You can write your code in this editor
var col = c_gray;

var y1 = room_height;
var y2 = room_height/2;
var width = room_width/16;
for(var i = 0; i < 16; i++) {
	var x1 = width * i;
	var x2 = width * (i + 1);
	draw_line_color(x1, y1, x2, y2, col, col);
}
for(var i = 0; i < 8; i++) {
	var x1 = 0;
	var x2 = room_width;
	var py = y2 + (y2/8) * i
	draw_line_color(x1, py, x2, py, col, col);
}
