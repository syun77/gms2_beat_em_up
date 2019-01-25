/*
enum eAttackProperties {
	HitSprite,     // 0: hit-box
	Power,         // 1: value to damage a fight
	StartupFrame,  // 2: this frame is not occured a hit-box
	ActiveFrame,   // 3: this frame to start a hit-box
	RecoveryFrame, // 4: end of frame you can move 
	LaunchOfPower, // 5: the power to launch a fight
	
	Length,
};
*/

var _type = argument0;

var _hit_sprite      = argument1;
var _power           = argument2;
var _startup_frame   = argument3;
var _active_frame    = argument4;
var _recovery_frame  = argument5;
var _launch_of_power = argument6;

global.attack_data[_type, eAttackProperties.HitSprite]     = _hit_sprite;
global.attack_data[_type, eAttackProperties.Power]         = _power;
global.attack_data[_type, eAttackProperties.StartupFrame]  = _startup_frame;
global.attack_data[_type, eAttackProperties.ActiveFrame]   = _active_frame;
global.attack_data[_type, eAttackProperties.RecoveryFrame] = _recovery_frame;
global.attack_data[_type, eAttackProperties.LaunchOfPower] = _launch_of_power;

