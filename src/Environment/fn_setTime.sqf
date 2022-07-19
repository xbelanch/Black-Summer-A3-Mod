private ["_preset", "_now"];

_preset = _this select 0;
_now = date;

switch(_preset) do
{
    case "FULL_MOON":
    {
        setDate [2035, 9, 9, 1, 15];
    };
    case "NO_MOON":
    {
        setDate [2035, 9, 24, 1, 15];
    };
    case "SPRING":
    {
        setDate [2035, 4, 15, _now select 3, _now select 4];
    };
    case "SUMMER":
    {
        setDate [2035, 7, 15, _now select 3, _now select 4];
    };
    case "AUTUMN":
    {
        setDate [2035, 10, 15, _now select 3, _now select 4];
    };
    case "WINTER":
    {
        setDate [2035, 12, 24, _now select 3, _now select 4];
    };
};
