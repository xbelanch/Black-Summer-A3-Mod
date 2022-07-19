// Spawn a simple civil plane
private [
"_planeType", "_planeSide", "_planeAltitude"
];

_locCP = getArray (configFile >> "CfgWorlds" >> worldName >> "centerPosition");
_mkr = createMarker [format ["Marker_%1",random 100],_locCP];
_mkr setMarkerColor "colorWhite";
_mkr setMarkerType "mil_circle";
_mkr setMarkerText format ["Map Center Position: %1",str _locCP];

// Radius
_locRD = 5500;
// Nearest locations from center position
_nLocs = nearestLocations [_locCP, ["NameCityCapital", "NameCity", "NameVillage" ], _locRD];
// Nearest objcts from center position
_nObjs = _locCP nearObjects _locRD;

// Debug
[__FILE__,__LINE__, format ["Locations found %1", _nLocs]] call BSM_fnc_log;
[__FILE__,__LINE__, format ["Objects found: %1", _nObjs]] call BSM_fnc_log;

// Debug on map
// Debug nearestObjects
if (BSM_PLANE_DEBUG_NEARESTOBJECTS) then {
    {
        _mkr = createMarker [format ["Marker_%1", random 100], getPos _x];
        _mkr setMarkerColor "colorOrange";
        _mkr setMarkerType "mil_dot";
        _mkr setMarkerText format [" %1", str _x];
    } forEach _nObjs;
};

_planeType = [_this, 0, "O_Heli_Attack_02_F",[""]] call BIS_fnc_param;
_planeSide = [_this, 1, EAST] call BIS_fnc_param;
_planeAltitude = [_this, 2, 100,[0]] call BIS_fnc_param;

_spawnPlane = [getPos player, 180, _planeType, _planeSide] call BIS_fnc_spawnVehicle;
_plane = _spawnPlane select 0; // BIS_fnc_spawnVehicle returns an array
_plane flyInHeight _planeAltitude;

// Force to land where player's position
_dynamicAirport1 = "DynamicAirport_01_F" createVehicle position (_nObjs select 1);
_plane landAt _dynamicAirport1;

// @TODO: Why this doesn't not work?
[format ["%1: testing bsm_fnc_showCommandTextLocal", __FILE__]] call bsm_fnc_showCommandTextLocal;

// Plane will destroyed if player is closer (_radius)
_radius = 64;
_test1 = [_plane, _radius] spawn {
    _p = _this select 0;
    _r = _this select 1;
    waitUntil {sleep 1; [position _p , _r] call BSM_fnc_playerNear};
    _p setDamage 1;
    [__FILE__,__LINE__, format ["%1 @ %2", _p, diag_tickTime]] call BSM_fnc_log;
};

_plane
