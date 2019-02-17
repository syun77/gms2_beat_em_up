/// @description Insert description here
// You can write your code in this editor
objHUD.player_id = id;

var vx = 0;
var vy = 0;

var MOVE_SPEED = 3;
var MOVE_SPEED_Z = 2;

var is_forward  = false;
var is_backward = false;

if(keyboard_check(vk_left)) {
	vx = -MOVE_SPEED;
	if(dir == eDir.Left) {
		is_forward = true;
	}
	else {
		is_backward = true;
	}
}
else if(keyboard_check(vk_right)) {
	vx = MOVE_SPEED;
	if(dir == eDir.Right) {
		is_forward = true;
	}
	else {
		is_backward = true;
	}
}
	
if(keyboard_check(vk_up)) {
	vy = MOVE_SPEED_Z;
}
else if(keyboard_check(vk_down)) {
	vy = -MOVE_SPEED_Z;
}

scrPlayer_move(vx, vy);
scrPlayer_damage();

var is_punch = keyboard_check_pressed(ord("Z"));
var is_kick  = keyboard_check_pressed(ord("X"));

scrPlayer_action(is_punch, is_kick, is_forward, is_backward);
