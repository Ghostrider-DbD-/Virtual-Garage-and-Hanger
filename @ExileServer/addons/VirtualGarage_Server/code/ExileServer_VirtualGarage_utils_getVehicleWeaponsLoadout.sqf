/*

*/
if (isNil "RRR_getVehicleLoadouts") then {diag_log "key function missing: RRR_getVehicleLoadouts"};
private _loadout = [_vehicle] call RRR_getVehicleLoadouts;
diag_log format["getVehicleWeaponsLoadout: _vehicle = %2 | _loadout = %1",_loadout,_vehicle];
_loadout