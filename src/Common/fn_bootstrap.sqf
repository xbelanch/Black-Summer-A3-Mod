// Disable saving in single player mode (not needed for this demonstration)
enableSaving [false,false];

[__FILE__,__LINE__, "Bootstrapping Black Summer Mod..."] call BSM_fnc_log;

call compile preprocessFileLineNumbers "config.sqf";
call compile preprocessFileLineNumbers "Terrain\worldConfig.sqf";

if (isServer) then {
    [] spawn BSM_fnc_missionTriggers;
    [] spawn BSM_fnc_initServer;
};

if (hasInterface) then {
    [] call BSM_fnc_initLocalPlayer;
};

// // Globals
// BSM_CurrentDate = "";
// BSM_SunriseSunset = [];
// BSM_CurrentEnvironment = [];

// private ["_plane"];

// // BSM means Black Summer Mod
// // _aerodrome = [] call BSM_fnc_spawnAerodrome;
// _plane = ["C_Plane_Civil_01_F", WEST, 3] call BSM_fnc_spawnPlane;
