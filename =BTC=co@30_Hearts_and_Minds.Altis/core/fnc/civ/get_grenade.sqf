params ["_pos", "_range", ["_units", []]];

if (_units isEqualTo []) then {
    _units = _pos nearEntities [btc_civ_type_units, _range];
};

_units = (_units select {side _x isEqualTo civilian});

if (_units isEqualTo []) exitWith {};

{
    if (btc_debug_log) then {
        [format ["%1 - %2", _x, side _x], __FILE__, [false]] call btc_fnc_debug_message;
    };

    _x call btc_fnc_rep_remove_eh;

    [_x] call btc_fnc_civ_add_grenade;

    [_x] joinSilent createGroup [btc_enemy_side, true];

    (group _x) setVariable ["getWeapons", true];

    (group _x) setBehaviour "AWARE";
    private _wp = (group _x) addWaypoint [_pos, 10];
    _wp setWaypointType "GUARD";
    _wp setWaypointCombatMode "RED";
} forEach [selectRandom _units];
