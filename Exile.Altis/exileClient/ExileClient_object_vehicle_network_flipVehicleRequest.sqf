/**
 * ExileClient_object_vehicle_network_flipVehicleRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 
   Modified by Ghostrider to prevent issues with flipping armor.
 */
 
private["_vehicleID", "_vehicle", "_pos","_bbr","_p1","_p2","_maxHeight"];
_vehicleID = _this select 0;
_vehicle = objectFromNetId _vehicleID;
if(local _vehicle)then
{
    _bbr = boundingBoxReal _vehicle;
    _p1 = _bbr select 0;
    _p2 = _bbr select 1;
    _maxHeight = abs ((_p2 select 2) - (_p1 select 2));
	_vehicle allowDamage false;
	_vehicle setVectorUp [0, 0, 1];
	_pos = getPosATL _vehicle;
	_pos set [2,(_pos select 2) + _maxHeight];
	_vehicle setPosATL _pos;
	_vehicle setVelocity [0,0,0];
	uiSleep 10;
	_vehicle allowDamage true;
}
else
{
	"FLIP: Local object is not local DEFUCK!" call ExileClient_util_log;
};
true