/*

 	Name: ExileServer_VirtualGarage_network_SpawnRequestedVehicle.sqf
 	Author(s): Shix
  	Copyright (c) 2016 Shix
  	This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
  	To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 	Description: handles spawn Vehicle Requests
	Modified by GhostriderDbD to store money, textures, inventory and a nickname	 
*/
private["_sessionID","_parameters","_vehicleClass","_pinCode","_vehicleFuel","_vehicleDamage","_vehicleHitPoints","_vehicleDatabaseID","_playerObject","_salesPrice","_playerMoney",
		"_position","_vehicleObject","_responseCode","_vehiclePosition","_vehicleVector","_vehNickname"];
params["_sessionID","_parameters"];

/*
_parameters params["_vehicleClass","_pinCode","_vehicleFuel","_vehicleDamage","_vehicleHitPoints",
	"_vehicleDatabaseID","_vehicleTextures","_vehicleMoney","_vehicleItems","_vehicleWeapons","_vehicleMags","_vehicleCntnr","_vehiclePosition","_vehicleVector","_vehNickname"];
*/
//{diag_log format["_parameter %1 = %2",_forEachIndex,_x]}forEach _parameters;
//_sessionID = _this select 0;
//_parameters = _this select 1;
_vehicleClass = _parameters select 0;
_pinCode = _parameters select 1;
_vehicleFuel = _parameters select 2;
_vehicleDamage = _parameters select 3;
_vehicleHitPoints = _parameters select 4;
_vehicleDatabaseID = _parameters select 5;
_vehicleTextures = _parameters select 6;
_vehicleMoney = _parameters select 7;
//diag_log format["ExileServer_VirtualGarage_network_SpawnRequestedVehicle: _vehicleMoney = %1",_vehicleMoney];
_vehicleItems = _parameters select 8;
_vehicleWeapons = _parameters select 9;
_vehicleMags = _parameters select 10;
_vehicleCntnr = _parameters select 11;
_vehiclePosition = _parameters select 12;
_vehicleVector = _parameters select 13;
_vehNickName = _parameters select 14;
//diag_log format["ExileServer_VirtualGarage_network_spawnRequestedVehicle: _parameters = %1",_parameters];
//_weaponsLoadout = _parameters select 15;
private _vehicleLoadout = format["getVehicleLoadoutVG:%1",_vehicleDatabaseID] call ExileServer_system_database_query_selectSingle;
//diag_log format["VG_spawnVehicle: _weaponLoadout for vehicle %1 of displayName %2 = %3 with typeName = %4",_vehicleClass,getText(configFile >> "CfgVehicles" >> _vehicleClass >> "displayName"),_vehicleLoadout,typeName _vehicleLoadout];
//diag_log format["VG_spawnVehicle: _weaponLoadout / 0 / 0 for vehicle %1 of displayName %2 = %3 with typeName = %4",_vehicleClass,getText(configFile >> "CfgVehicles" >> _vehicleClass >> "displayName"),_vehicleLoadout,_vehicleLoadout select 0 select 0]; 
//diag_log format["VG_spawnVehicle: _weaponLoadout / 0 / 1 for vehicle %1 of displayName %2 = %3 with typeName = %4",_vehicleClass,getText(configFile >> "CfgVehicles" >> _vehicleClass >> "displayName"),_vehicleLoadout,_vehicleLoadout select 0 select 1]; 

if (isNil "RRR_setVehicleLoadout") then 
{
	//diag_log format["waiting for isNil RRR_setVehicleLoadout to be compiled"];
	while {isNil "RRR_setVehicleLoadout"} do {uiSleep 1;};
};

//diag_log format["ExileServer_VirtualGarage_network_SpawnRequestedVehicle: _vehicleLoadout = %1",_vehicleLoadout];
try
{
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if ((_playerObject distance _vehiclePosition) > 150) then
	{
		_vehiclePosition = (getPos _playerObject) findEmptyPosition [1,80, _vehicleClass]
	};
	if (isNull _playerObject) then
	{
		throw "The is no player";
	};
	if !(alive _playerObject) then
	{
		throw "The player is dead";
	};
	if !((count _pinCode) isEqualTo 4) then
	{
		throw "The pin code is does not equal 4 chars";
	};

	_position = (_vehiclePosition) findEmptyPosition [0, 15, _vehicleClass];
	if (_position isEqualTo []) then
	{
			throw "Position is not defined";
	};
	
	_vehicleObject = [_vehicleClass, _position, 0, true, _pinCode] call ExileServer_object_vehicle_createPersistentVehicle;
	[_vehicleObject,_vehicleLoadout select 0] call RRR_setVehicleLoadout;
	//[_vehicleObject,_weaponLoadouts select 0] call RRR_setVehicleLoadout;

	//_vehicleObject setDir _vehicleVector;
	_vehicleObject setVectorDirAndUp _vehicleVector;
	_vehicleObject setVariable ["ExileOwnerUID", (getPlayerUID _playerObject)];
	_vehicleObject setVariable ["GRG_nickName",_vehNickname,true];
	_vehSpawnState = getNumber (missionconfigfile >> "VirtualGarageSettings" >> "VirtualGarage_VehicleSpawnState");
	if (_vehSpawnState == 1) then
	{
		_vehicleObject setVariable ["ExileIsLocked",1,true];
		_vehicleObject lock 2;
	};
	_vehicleObject setFuel _vehicleFuel;
	_vehicleObject setDamage _vehicleDamage;
	_reapplyDamage = getNumber (missionconfigfile >> "VirtualGarageSettings" >> "VirtualGarage_ReapplyDamage");
	if (_reapplyDamage == 1) then
	{
		if ((typeName _vehicleHitPoints) isEqualTo "ARRAY") then
		{
			{
				_vehicleObject setHitPointDamage [_x select 0, _x select 1];
			}forEach _vehicleHitPoints;
		};
	};
	_GivePlayerPinCode = getNumber (missionconfigfile >> "VirtualGarageSettings" >> "VirtualGarage_GivePlayerPicCode");
	//diag_log format["ExileServer_VirtualGarage_network_SpawnRequestedVehicle:: _vehicleMoney = %1",_vehicleMoney];
	_vehicleObject setVariable["ExileMoney",_vehicleMoney,true];
	[_vehicleObject, _vehicleItems] call ExileServer_util_fill_fillItems;
	[_vehicleObject, _vehicleMags] call ExileServer_util_fill_fillMagazines;
	[_vehicleObject, _vehicleWeapons] call ExileServer_util_fill_fillWeapons;
	
	if ((typeName _vehicleCntnr) isEqualTo "ARRAY") then 
	{
		if !(_vehicleCntnr isEqualTo []) then
		{
			[_vehicleObject, _vehicleCntnr] call ExileServer_util_fill_fillContainers;
		};
	};
	
	if (typeName _vehicleTextures isEqualTo "ARRAY") then
	{
		{
			_vehicleObject setObjectTextureGlobal [ _forEachIndex, format["%1",_vehicleTextures select _forEachIndex] ];
		}forEach _vehicleTextures;
	};	



	format ["deleteVehicleFromVG:%1", _vehicleDatabaseID] call ExileServer_system_database_query_fireAndForget;	

	if (_GivePlayerPinCode == 1) then {
		_msg = Format["Vehicle Successfully Retrieved PIC Code:%1",_pinCode];
		[_sessionID, "notificationRequest", ["Success", [_msg]]] call ExileServer_system_network_send_to;
	}
	else
	{
		_msg = Format["Vehicle Successfully Retrieved"];
		[_sessionID, "notificationRequest", ["Success", [_msg]]] call ExileServer_system_network_send_to;
	};

	_vehicleObject call ExileServer_object_vehicle_database_insert;
	_vehicleObject call ExileServer_object_vehicle_database_update;
	[_sessionID, "RetrieveVehicleResponse", ["true",netId _vehicleObject]] call ExileServer_system_network_send_to;
}
catch
{
	[_exception,"Virtual Garage Spawn Vehicle Error"] call ExileServer_VirtualGarage_utils_diagLog;
  	[_sessionID, "RetrieveVehicleResponse", ["false",_vehicleObject]] call ExileServer_system_network_send_to;
};
