/// @description Insert description here
// You can write your code in this editor
timer++;

var cnt_enemy = 0;
with(objEnemy) {
	if(hp > 0) {
		cnt_enemy++;
	}
}
if(cnt_enemy == 0) {
	// finish blow.
	is_finish = true;
	game_set_speed(15, gamespeed_fps)
}
if(is_finish) {
	finish_timer++;
	if(finish_timer > 20) {
		is_finish = false;
		game_set_speed(60, gamespeed_fps)
	}
}

if(instance_exists(objPlayer) == false) {
	return;
}

var px = objPlayer.x;
var pz = objPlayer.z;

var prev_left = cnt_left;
var prev_right = cnt_right;
cnt_left = 0;
cnt_right = 0;
with(objEnemy) {
	var dx = px - x;
	if(dx > 0) {
		other.cnt_left++;
	}
	if(dx < 0) {
		other.cnt_right++;
	}
}
if(prev_left == cnt_left and prev_right == cnt_right) {
	return;
}

var furthest = noone;
var distance = 0;
with(objEnemy) {
	to_distance = eDistance.Normal;
	var dist = point_distance(x, z, px, pz);
	if(dist > distance) {
		distance = dist;
		furthest = id;
	}
}
if(furthest != noone) {
	furthest.to_distance = eDistance.Furthest;
}

var nearest = noone;
var distance = 999999;
with(objEnemy) {
	var dist = point_distance(x, z, px, pz);
	if(dist < distance) {
		distance = dist;
		nearest = id;
	}
}
if(nearest != noone) {
	nearest.to_distance = eDistance.Nearest;
}
