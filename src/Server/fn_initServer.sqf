if(!isServer) exitWith{};

[__FILE__,__LINE__, "Server started."] call BSM_fnc_log;

if(isNil("bsm_var_commonFnInitialized")) then {
    call compile preprocessFileLineNumbers "Scripts\Common\Functions.sqf";
};

// [format ["%1: testing bsm_fnc_showCommandTextLocal", __FILE__]] call bsm_fnc_showCommandTextLocal;
// Parse parameters

// Parse and load values from cfgParams.hpp
private _cfgParams = missionConfigFile >> "Params";
private _paramNames = 'true' configClasses _cfgParams apply {configName _x};
[__FILE__,__LINE__, format["_paramNames: %1", _paramNames]] call BSM_fnc_log;

// Load default params for SP && Editor
if (isNil "paramsArray") then {
    paramsArray = _paramNames apply {getNumber (_cfgParams >> _x >> "default")};
};

[__FILE__,__LINE__, format["paramsArray: %1", paramsArray]] call BSM_fnc_log;

{
    private _param = _cfgParams >> _x;
    private _name = getText (_param >> "title");
    private _value = paramsArray select _forEachIndex;
    missionNamespace setVariable [_x, _value, true];
    private _values = getArray (_param >> "values");
    private _texts = getArray (_param >> "texts");
    private _valueName = _texts select (_values find _value);
    private _default = getNumber (_param >> "default");
    private _defaultName = _texts select (_values find _default);
} forEach _paramNames;

// Set time of the day thanks to BSM_Param_DayTime
private ["_hour","_date"];
[__FILE__,__LINE__, format["BSM_Param_DayTime: %1", BSM_Param_DayTime]] call BSM_fnc_log;
_hour = BSM_Param_DayTime;
switch (BSM_Param_DayTime) do {
    case 24: {
		_hour = round(random(24));
	};
    case 25: {
		_hour = 6 + round(random(10));  // Between 0600 and 1600
	};
	case 26: {
		_hour = 17 + round(random(11)); // Between 1700 and 0400
		_hour = _hour % 24;
	};
    default { _hour = BSM_Param_DayTime };
};
_date = date;
_date set [3,_hour];
_date set [4,0];
[_date] call bis_fnc_setDate;

// // Set environment
// ["STORMY", 0] call BSM_fnc_setWeather;
// ["WINTER"] call BSM_fnc_setTime;
// skipTime 3; // Three hours forward time jump
call BSM_fnc_inspect;


// @INFO: Another simple way (local way) to get Param value but locally
_timeMultiplier = "BSM_Param_TimeMultiplier" call BIS_fnc_getParamValue;
setTimeMultiplier _timeMultiplier;
// instead of
setTimeMultiplier BSM_Param_TimeMultiplier;

[__FILE__,__LINE__, format["Time of the day: %1", date]] call BSM_fnc_log;
