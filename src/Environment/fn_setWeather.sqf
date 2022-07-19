// Set weather conditions
private ["_preset", "_delay"];

//@TODO: Replace this by BIS_fnc_param
_preset = _this select 0;
_delay = if(count _this > 1) then {_this select 1} else {30};

switch(_preset) do
{
    case "STORMY":
    {
        _delay setOvercast 1;
        _delay setGusts 1;
        _delay setWindForce 1;
        _delay setWindStr 1;
        _delay setLightnings 1;
        _delay setFog [1, 1, 60];
    };
    case "CLEAR":
    {
        _delay setOvercast 0;
        _delay setGusts 0;
        _delay setWindForce 0;
        _delay setWindStr 0;
        _delay setLightnings 0;
    };
    case "OVERCAST":
    {
        _delay setOvercast 0.5;
        _delay setGusts 0.5;
        _delay setWindForce 0.5;
        _delay setWindStr 0.5;
        _delay setLightnings 0.5;
    };
};
