/**
 * ExileClient_util_world_isInTraderZone
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_position", "_altitude", "_result"];
//diag_log format["ExileClient_util_world_isInTraderZone: _this = %1",_this];
//diag_log format["ExileClient_util_world_isInTraderZone: typeName _this = %1",typeName _this];
if (typeName _this isEqualTo "ARRAY") then // it must be a position
{
	_position = _this;
};
if (typeName _this isEqualTo "OBJECT") then
{
	_position = getPosATL _this;
};
_altitude = _position select 2;
//diag_log format["ExileClient_util_world_isInTraderZone: _position = %1",_position];
//diag_log format["ExileClient_util_world_isInTraderZone: altitude = %1", _position select 2];
_result = false;
{
	if (((_x select 0) distance2D _position) < (_x select 1) && _altitude < 30) exitWith
	{
		_result = true;
	};
}
forEach ExileTraderZoneMarkerPositionsAndSize;
_result