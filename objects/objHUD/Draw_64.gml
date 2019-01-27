if(player_id != noone)
{
	var hp = player_id.hp;
	var x1 = 8;
	var y1 = 8;
	var x2 = x1 + 300;
	var y2 = y1 + 16;

	var max_hp = 100;
	var rate = (hp / max_hp) * 100;
	draw_healthbar(x1, y1, x2, y2, rate, c_black, c_red, c_lime, 0, true, true)
	draw_text(x1, y1, string(hp));
}

if(enemy_id != noone)
{
	var hp = enemy_id.hp;
	var x1 = 8;
	var y1 = 32;
	var x2 = x1 + 300;
	var y2 = y1 + 16;

	var max_hp = 100;
	var rate = (hp / max_hp) * 100;
	draw_healthbar(x1, y1, x2, y2, rate, c_black, c_red, c_lime, 0, true, true)
	draw_text(x1, y1, string(hp));
}
