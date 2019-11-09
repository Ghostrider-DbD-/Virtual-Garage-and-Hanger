/**
 * ExileServer_object_vehicle_event_onMPKilled
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicleObject","_killer","_weapon","_txt","_vehicleClassName","_vehicleID","_vehicleObject","_vehicleOwnerName","_ownerUID","_data1"];
if !(isServer) exitWith {true};
_vehicleObject = _this select 0;
_killer = _this select 1;
_weapon = currentWeapon _killer;
_txt = (gettext (configFile >> 'cfgWeapons' >> _weapon >> 'displayName'));
if (_txt == "") then {
   _weapon = typeOf (vehicle _killer);
   _txt = (getText (configFile >> 'cfgVehicles' >> _weapon >> 'displayName'));
};
_vehicleID = _vehicleObject getVariable ["ExileDatabaseID", -1];
_data1 =  format["getVehicleOwnerID:%1",_vehicleID] call ExileServer_system_database_query_selectFull; //  _StoredVehicles = format ["getStoredVehicles:%1", _uid] call ExileServer_system_database_query_selectFull;
diag_log format ["_object_vehicle_event_onMPKilled: _data1 = %1",_data1];
_ownerUID = _data1 select 0 select 0;
_data1 = format["getPlayerName:%1",_ownerUID] call ExileServer_system_database_query_selectFull;
_vehicleOwnerName = _data1 select 0 select 0;
diag_log format["_object_vehicle_event_onMPKilled: _vehicleOwnerName = %1",_vehicleOwnerName];
diag_log format["_object_vehicle_event_onMPKilled: _ownerUID = %1",_ownerUID];
_vehicleClassName = typeOf _vehicleObject;
diag_log format["_object_vehicle_event_onMPKilled: _vehicleClassName = %1",_vehicleClassName];
diag_log format["_object_vehicle_event_onMPKilled: _txt = %1",_txt];
format["logVehicleKill:%1:%2:%3:%4:%5:%6:%7",_vehicleClassName,_ownerUID,_vehicleOwnerName,getPlayerUID _killer, name _killer, _txt, _killer distance2d _vehicleObject] call ExileServer_system_database_query_selectFull;
_vehicleObject call ExileServer_object_vehicle_remove;
_vehicleObject setVariable ["ExileDiedAt", time];
true