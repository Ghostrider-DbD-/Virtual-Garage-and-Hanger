/*

 	Name: ExileClient_VirtualHanger_network_GetStoredVehiclesResponse.sqf
 	Author(s): Shix; Modified by Ghostrider[GRG] to support virtual hangers
    Copyright (c) 2016 Shix
 	Description: Gets a list of stored vehicles and adds them to the display
*/

private ["_display","_StoredVehiclesList","_display","_this","_VehiclesCount","_className","_vehDispName","_VehID","_index","_StoredVehiclesList"];
disableSerialization;
_display = uiNameSpace getVariable ["VirtualHangerDialog", displayNull];
_StoredVehiclesList = _display displayCtrl 1500;
_StoredVehicles = _this select 0;
//diag_log format["_VirtualHanger_network_GetStoredVehiclesResponse: _StoredVehicles = %1",_StoredVehicles];
StoredVehicles = [];
StoredVehiclesCount = count _StoredVehicles;
{
	_className = _x select 1;
	//diag_log format["_VitualHanger_network_GetStoredVehilcesResponse: _className = %1 isKindOf Air =%2 where _x = %3",_className,_className isKindOf "Air", _x];
	if (_className isKindOf 'Air') then {StoredVehicles pushback _x};
} forEach _StoredVehicles;

_VehiclesCount = count StoredVehicles;
for "_i" from 0 to (_VehiclesCount) -1 do {
  _className = (StoredVehicles select _i)select 1;
  _vehDispName = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
  _VehID = (StoredVehicles select _i)select 0;
  _index = _StoredVehiclesList lbAdd (format ["%1", toUpper _vehDispName]);
  _StoredVehiclesList lbSetData [_index, str (_VehID)];
};
lbSetCurSel [1500, 0];
