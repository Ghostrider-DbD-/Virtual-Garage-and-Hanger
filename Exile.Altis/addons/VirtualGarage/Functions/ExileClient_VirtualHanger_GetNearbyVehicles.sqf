/*

 	Name: ExileClient_VirtualHanger_GetNearbyVehicles.sqf
 	Author(s): Shix; modified to support virtual hangers by Ghostrider[GRG]
    Copyright (c) 2016 Shix
 	Description: Gets a list of nearby aircraft with the ability to be stored in Virtual Hanger.
*/

private ["_display","_searchRadius","_nearVehicles","_nearByVehiclesList","_vehDispName","_index"];
disableSerialization;
_display = uiNameSpace getVariable ["VirtualHangerDialog", displayNull];
_searchRadius = 75;
_nearVehicles = nearestObjects [player, ["Air"], _searchRadius];
//diag_log format["nearVehicles = %1",_nearVehicles];
localVehicles = [];
{
	if (local _x) then
  	{
      if (alive _x) then  //  only persistant vehicles will be included
      {
        localVehicles pushBack _x;
      };
  	};
}forEach _nearVehicles;

_nearByVehiclesList = _display displayCtrl 1501;
lbClear _nearByVehiclesList;
{
  _vehDispName = getText (configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
  _index = _nearByVehiclesList lbAdd (format ["%1",toUpper _vehDispName]);
  _nearByVehiclesList lbSetData [_index, netId _x];
} forEach localVehicles;

