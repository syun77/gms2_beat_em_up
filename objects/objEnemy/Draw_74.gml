/// @description Insert description here
// You can write your code in this editor
if(debug_draw_info) {
	var px = x;
	var py = -z;
	var str = "";
	switch(to_distance) {
	case eDistance.Nearest:
		str = "Nearest";
		break;
	case eDistance.Furthest:
		str = "Furthest";
		break;
		
	case eDistance.Normal:
		str = "Normal";
		break;
	}
	
	draw_text(px, py, str);
	draw_text(px, py+16, string(id));
}
