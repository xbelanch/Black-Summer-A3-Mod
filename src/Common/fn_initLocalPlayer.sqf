// initLocalPlayer.sqf
[__FILE__,__LINE__, format["Client running for %1 (%2)", name player, str _this]] call BSM_fnc_log;

// That's the common way I found on a lot of projects
if ( !hasInterface ) exitWith {};
waitUntil { !isNull player};

[__FILE__,__LINE__, format["Player %1 (%2) is on live!", name player, str _this]] call BSM_fnc_log;
