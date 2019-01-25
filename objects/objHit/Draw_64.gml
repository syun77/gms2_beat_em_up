/// @description Insert description here
// You can write your code in this editor
var col = c_red;

var ofs_y = -1 * z;

var x1 = bbox_left;
var y1 = bbox_top + ofs_y;
var x2 = bbox_right;
var y2 = bbox_bottom + ofs_y;

draw_line_color(x1, y1, x2, y1, col, col);
draw_line_color(x2, y1, x2, y2, col, col);
draw_line_color(x2, y2, x1, y2, col, col);
draw_line_color(x1, y2, x1, y1, col, col);
