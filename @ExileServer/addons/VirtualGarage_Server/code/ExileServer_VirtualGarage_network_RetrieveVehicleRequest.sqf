/*

    Name: ExileServer_VirtualGarage_network_RetrieveVehicleRequest.sqf
 	  Author(s): Shix
    Copyright (c) 2016 Shix
    This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 	  Description: handles retrieve vehicle requests
	  
	Modified by GhostriderDbD to store money, textures, inventory and a nickname
*/
private["_sessionID","_vehicleDBID","_player","_VehicleInfo","_vehClass","_vehFuel","_vehDamage","_vehHitPoints","_vehPinCode","_vehTextures","_vehMoney","_vehItm","_vehWpn","_vehMag","_vehCntnr",
	    "_vehPosn","_vehVector","_vehNickname"];
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
  //(_VehicleInfo select 0) params["_vehClass","_accountUID","_vehFuel","_vehDamage","_vehHitPoints","_vehPinCode","_vehTextures","_vehMoney","_vehItm","_vehWpn","_vehMag","_vehCntnr","_vehPosn","_vehVector","_vehNickname"];
  diag_log format["ExileServer_VirtualGarage_network_RetrieveVehicleRequest::  _VehicleInfo = %1",_VehicleInfo];
  
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
  _vehPosn = (_VehicleInfo select 0) select 13;
  _vehVector = (_VehicleInfo select 0) select 14;
  _vehNickname = (_VehicleInfo select 0) select 15;
  
  [_sessionID,[_vehClass,_vehPinCode,_vehFuel,_vehDamage,_vehHitPoints,_vehicleDBID,_vehTextures,_vehMoney,_vehItm,_vehWpn,_vehMag,_vehCntnr,_vehPosn,_vehVector,_vehNickname]] call ExileServer_VirtualGarage_network_SpawnRequestedVehicle;
} catch {
  [_exception,"Virtual Garage Retrieve Vehicle Error"] call ExileServer_VirtualGarage_utils_diagLog;
}
