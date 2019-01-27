/// @description Insert description here
// You can write your code in this editor
if(debug_draw_info) {
	var px = x;
	var py = -z;
	var str = "";
	switch(to_distance) {
	case eDistance.Nearest:  str = "Nearest";  break;
	case eDistance.Furthest: str = "Furthest"; break;		
	case eDistance.Normal:   str = "Normal";   break;
	}
	
	var str_ai = "";
	switch(ai_state) {
	case eAI.Standby:  str_ai = "Standby";  break;
	case eAI.CloseTo:  str_ai = "CloseTo";  break;
	case eAI.GoAround: str_ai = "GoAround"; break;
	case eAI.Dash:     str_ai = "Dash";     break;
	}
	
	draw_text(px, py, string(id) + ":" + str);
	draw_text(px, py+16, string(str_ai));
}
