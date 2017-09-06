/*

    Name: ExileServer_VirtualHanger_network_VH_RetrieveVehicleRequest.sqf
 	  Author(s): Shix
    Copyright (c) 2016 Shix; modified for Virtual Hanger by Ghostrider [GRG]
    This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 	  Description: handles retrieve vehicle requests
	  
	 Modified by GhostriderDbD to handle textures and inventory
	 5/28/17
*/
private["_sessionID","_vehicleDBID","_player","_VehicleInfo","_vehClass","_vehFuel","_vehDamage","_vehHitPoints","_vehPinCode","_vehTextures","_vehMoney","_vehItm","_vehWpn","_vehMag","_vehCntnr"];
_sessionID = _this select 0;
_vehicleDBID = (_this select 1) select 0;
try
{
  _player = _sessionID call ExileServer_system_session_getPlayerObject;
  if (isNull _player) then
  {
    throw "No player was found from the session ID";
  };
  _VehicleInfo = format ["RetrieveVehicle:%1", _vehicleDBID] call ExileServer_system_database_query_selectFull;
   _vehClass = (_VehicleInfo select 0) select 1;
  _vehFuel = (_VehicleInfo select 0) select 3;
  _vehDamage = (_VehicleInfo select 0) select 4;
  _vehHitPoints = (_VehicleInfo select 0) select 5;
  _vehPinCode = (_VehicleInfo select 0) select 6;
  _vehTextures = (_VehicleInfo select 0) select 7;
  _vehMoney = (_VehicleInfo select 0) select 8;
  _vehItm = (_VehicleInfo select 0) select 9;
  _vehWpn = (_VehicleInfo select 0) select 10;
  _vehMag = (_VehicleInfo select 0) select 11;
  _vehCntnr = (_VehicleInfo select 0) select 12;
  [_sessionID,[_vehClass,_vehPinCode,_vehFuel,_vehDamage,_vehHitPoints,_vehicleDBID,_vehTextures,_vehMoney,_vehItm,_vehWpn,_vehMag,_vehCntnr]] call ExileServer_VirtualHanger_network_SpawnRequestedVehicle;
} catch {
  [_exception,"Virtual Garage Retrieve Vehicle Error"] call ExileServer_VirtualGarage_utils_diagLog;
}
