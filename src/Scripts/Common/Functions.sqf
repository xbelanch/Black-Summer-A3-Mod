/*
File: Functions.sqf
Author: Who else?
Description: Utilities and helpers
*/

bsm_fnc_showCommandTextLocal = {
    private ["_text"];
    _text = _this select 0;

    if (!isNull player) then {
        player globalChat _text;
    };
    diag_log ("Title text: " + _text);
};

bsm_var_commonFnInitialized = true;
