addMissionEventHandler ["HandleDisconnect", btc_fnc_eh_handledisconnect];
addMissionEventHandler ["BuildingChanged", btc_fnc_eh_buildingchanged];
["ace_explosives_defuse", btc_fnc_eh_explosives_defuse] call CBA_fnc_addEventHandler;
