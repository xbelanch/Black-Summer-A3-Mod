private ["_text", "_date"];
	
_text = " ------------------ Inspecting Environment -------------------- ";
[__FILE__,__LINE__, _text] call BSM_fnc_log;

_text = format[" world: %1", worldName];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" mission: %1", missionName];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" is server: %1", isServer];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" is dedicated server: %1", isDedicated];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_date = date;
_text = format[" date: %1-%2-%3 %4:%5", _date select 0, _date select 1, _date select 2, _date select 3, _date select 4];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" time: %1", daytime];
[__FILE__,__LINE__, _text] call BSM_fnc_log;	
	
_text = format[" overcast: %1", overcast];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" fog: %1", fog];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" rain: %1", rain];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" rainbow: %1", rainbow];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" lightnings: %1", lightnings];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" humidity: %1", humidity];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" gusts: %1", gusts];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" waves: %1", waves];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" wind direction: %1", windDir];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" wind strength: %1", windStr];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" next weather change: %1", nextWeatherChange];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" fog forecast: %1", fogForecast];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = format[" overcast forecast: %1", overcastForecast];
[__FILE__,__LINE__, _text] call BSM_fnc_log;
	
_text = " ------------------ Inspection Complete -------------------- ";
[__FILE__,__LINE__, _text] call BSM_fnc_log;
