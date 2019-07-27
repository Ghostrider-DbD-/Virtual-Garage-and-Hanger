/*

 	Name: ExileServer_VirtualGarage_network_StoreVehicleRequest.sqf
 	Author(s): Shix
  Copyright (c) 2016 Shix
  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 	Description: Handles store Vehicle Requests
	
	Modified by GhostriderDbD to store money, textures, inventory and a nickname
*/
private["_sessionID","_vehNetID","_ownerUID","_vehicle","_player","_hitpoints","_vehicleHitpoints","_vehicleDBID","_pincode","_fuel","_damage","_txtr","_tabs","_itm","_wpn","_mags","_cntrs",
        "_vehicleID","_position","_vector","_nickName"];

_sessionID = _this select 0;
_vehNetID = (_this select 1) select 0;
_ownerUID = (_this select 1) select 1;
_nickName = (_this select 1) select 2;
//diag_log format["ExileServer_VirtualGarage_network_StoreVehicleRequest: _nickName = %1",_nickName];
try
{
  _vehicle = objectFromNetId _vehNetID;
  _player = _sessionID call ExileServer_system_session_getPlayerObject;
  if(isNull _vehicle)then
  {
    throw "No vehicle found from NetID";
  };
  if (isNull _player) then
  {
    throw "No player was found from the session ID";
  };
  if !(alive _player) then
  {
    throw "The player is dead .... Dead Means dead you cant do shit when you're dead";
  };
  if !((owner _vehicle) isEqualTo (owner _player)) then
  {
    throw "The player does not own the vehicle";
  };
  /*
  if (isNull (_vehicle getVariable "ExileOwnerUID")) then
  {
    throw "You Can Not Store None Persistent Vehicles";	
  };
  */
  if(_vehicle getVariable ["ExileIsPersistent",false] isEqualTo false) then
  {
    throw "You Can Not Store None Persistent Vehicles";
  };
  _hitpoints = getAllHitPointsDamage _vehicle;
  _vehicleHitpoints = [];
  if!(_hitpoints isEqualTo [])then
  {
    {
      _vehicleHitpoints pushBack [_x ,_vehicle getHitPointDamage _x];
    }forEach (_hitpoints select 0);
  };
  _vehicleDBID = _vehicle getVariable ["ExileDatabaseID",0];
  _pincode = _vehicle getVariable ["ExileAccessCode",""];
  //_nickName = _vehicle getVariable ["GRG_nickName",""];
  _fuel = fuel _vehicle;
  _damage = damage _vehicle;
  _txtr = getObjectTextures _vehicle;
  _tabs = _vehicle getVariable ["ExileMoney", 0];
  _itm = _vehicle call ExileServer_util_getItemCargo;
  _wpn = weaponsItemsCargo _vehicle;
  _mags = magazinesAmmoCargo _vehicle;
  _cntns = _vehicle call ExileServer_util_getObjectContainerCargo;
  _position = getPos _vehicle;
  _vector = getDir _vehicle; 
  _vehicleID = format ["insertVehicleToVG:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15", typeOf _vehicle,_ownerUID,_fuel,_damage,_vehicleHitpoints,_pincode,_txtr,_tabs,_itm,_wpn,_mags,_cntns,_position,_vector,_nickName] call ExileServer_system_database_query_selectFull;

  //diag_log format[" <--> _tabs = %1 typename %2",_tabs, typeName _tabs];
  //diag_log format[" <--> _itm = %1 typename %2",_itm, typeName _itm];
  //diag_log format[" <--> _mags = %1 typename %2",_mags, typeName _mags];
  //diag_log format[" <--> _wpn = %1 typename %2",_wpn, typeName _wpn];
  //diag_log format[" <--> _cntrs = %1 typename %2",_cntns, typeName _cntns];
 deleteVehicle _vehicle;

  [_sessionID,"StoreVehicleResponse",["true"]] call ExileServer_system_network_send_to;
  format ["deleteVehicle:%1", _vehicleDBID] call ExileServer_system_database_query_fireAndForget;
} catch {
  [_exception,"Virtual Garage Store Vehicle Error"] call ExileServer_VirtualGarage_utils_diagLog;
  [_sessionID,"StoreVehicleResponse",["false"]] call ExileServer_system_network_send_to;
};
