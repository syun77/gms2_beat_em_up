enum eAttackType {
	None,  // 0
	
	Punch,    // 1
	Kick,     // 2
	Uppercut, // 3
	
	Length,
};

enum eAttackProperties {
	HitSprite,     // 0: hit-box
	Power,         // 1: value of damage to fighter
	StartupFrame,  // 2: this frame is not occured a hit-box
	ActiveFrame,   // 3: this frame to start a hit-box
	RecoveryFrame, // 4: end of frame (you can't move) 
	LaunchOfPower, // 5: the power to launch a fight
	
	Length,
};

global.attack_data[eAttackType.Length, eAttackProperties.Length] = noone;

//            type                  0             1  2   3   4   5
scrAttack_add(eAttackType.Punch,    sprPunch,     3, 2, 10, 10,  0);
scrAttack_add(eAttackType.Kick,     sprKick,      5, 5, 20, 30,  5);
scrAttack_add(eAttackType.Uppercut, sprUppercut, 10, 3, 20, 30, 10);
