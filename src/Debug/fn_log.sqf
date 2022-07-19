// --- Log
// --- Usage: [__FILE__,__LINE__, <message>] execVM "scripts\Debug\log.sqf"
params [
	["_filename", [""]],
 	["_line", 99],
	["_msg", ""]
];
_filename = _filename splitString "\.";
if (count _filename > 2) then [{_filename = _filename select ((count _filename) - 2)}, {_filename = "File Unknown"}];

diag_log text format ["[Black Summer]::%1:l%2 %3", _filename, str _line, _msg ];
