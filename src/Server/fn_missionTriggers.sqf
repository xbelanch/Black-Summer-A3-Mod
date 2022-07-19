private ["_trigger"];

bsm_globalVar_AllPlayersDead = false;
bsm_globalVar_EscapeComplete = false;
bsm_globalVar_EscapeFailed = false;

if (isServer) then {
    // Testing trigger
	_trigger = createTrigger["EmptyDetector", [0,0,0], false];
	_trigger setTriggerInterval 2;
	_trigger setTriggerArea[0, 0, 0, false];
	_trigger setTriggerActivation["NONE", "PRESENT", false];
	_trigger setTriggerTimeout [3, 3, 3, true];
	// _trigger setTriggerStatements["a3e_var_Escape_MissionComplete && !a3e_var_Escape_SearchLeader_civilianReporting && !a3e_var_Escape_AllPlayersDead", """end2"" call A3E_fnc_endMissionServer;", ""];
}
