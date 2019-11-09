/*

 	Description: Handles writing messages to the server logs

*/

params["_vehicle","_weaponsLoadouts"];
diag_log format["_utils__geVehicleWeaponsLoadout: _vehicle = %1 | _loadout = %2",_vehicle,_weaponsLoadouts];
["_vehicle","_weaponsLoadouts"] call RRR_setVehicleLoadout;
