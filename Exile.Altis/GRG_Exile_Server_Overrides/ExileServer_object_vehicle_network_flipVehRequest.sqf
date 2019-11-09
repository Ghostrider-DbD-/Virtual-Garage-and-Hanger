/**
 * ExileServer_object_vehicle_network_flipVehRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID", "_parameters", "_vehicleID", "_vehicle", "_player", "_pos","_bbr","_p1","_p2","_maxHeight"];
_sessionID = _this select 0;
_parameters = _this select 1;
_vehicleID = _parameters select 0;
_vehicle = objectFromNetId _vehicleID;
_player = _sessionID call ExileServer_system_session_getPlayerObject;
try
{
	if (_vehicle distance _player > 7) then
	{
		throw "Player to far";
	};
	if !((crew _vehicle) isEqualTo []) then
	{
		throw "Vehicle not empty";
	};
	if (local _vehicle) then
	{
		_bbr = boundingBoxReal _vehicle;
		_p1 = _bbr select 0;
		_p2 = _bbr select 1;
		_maxWidth = abs ((_p2 select 0) - (_p1 select 0));
		_maxLength = abs ((_p2 select 1) - (_p1 select 1));
		_maxHeight = abs ((_p2 select 2) - (_p1 select 2));

		_vehicle allowDamage false;
		_vehicle setVectorUp [0, 0, 1];
		//_vehicle setVelocity [0,0,0];
		_pos = getPosATL _vehicle;
		_pos set [2,(_pos select 2) + _maxHeight];
		_vehicle setPosATL _pos;
		_vehicle setVelocity [0,0,0];
		//uiSleep 10;
		_vehicle allowDamage true;
	}
	else
	{
		_vehicle setOwner (owner _player);
		[_sessionID,"flipVehRequest",[_vehicleID]] call ExileServer_system_network_send_to;
	};
}
catch
{
	format["FlipVehicleRequest: %1", _exception] call ExileServer_util_log;
};
true