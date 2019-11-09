/**
 * ExileServer_object_vehicle_carefulCreateVehicle
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_vehicleClassName", "_position", "_direction", "_usePositionATL", "_temporaryPositionInOuterSpace", "_vehicleObject"];
_vehicleClassName = _this select 0;
_position = _this select 1;
_direction = _this select 2;
_usePositionATL = _this select 3;
_temporaryPositionInOuterSpace = 
[
	(_position select 0) - 250 + (random 500),
	(_position select 1) - 250 + (random 500),
	1000 + (random 1000)
];
_vehicleObject = createVehicle [_vehicleClassName, _temporaryPositionInOuterSpace, [], 0, "CAN_COLLIDE"];
_vehicleObject allowDamage false;
_vehicleObject removeAllEventHandlers "HandleDamage";
_vehicleObject addEventHandler["HandleDamage", {false}];
_vehicleObject setVelocity [0, 0, 0];
if ((typeName _direction) isEqualTo "ARRAY") then 
{
	_vehicleObject setVectorDirAndUp _direction;
}
else 
{
	_vehicleObject setDir _direction;
};
if (_usePositionATL) then
{
	_vehicleObject setPosATL _position;
}
else 
{
	_vehicleObject setPosASL _position;
};
_vehicleObject setVelocity [0, 0, 0];
_vehicleObject allowDamage true;
_vehicleObject removeAllEventHandlers "HandleDamage";
_vehicleObject setDamage 0;
clearBackpackCargoGlobal _vehicleObject;
clearItemCargoGlobal _vehicleObject;
clearMagazineCargoGlobal _vehicleObject;
clearWeaponCargoGlobal _vehicleObject;

if (getNumber (configFile >> "CfgSettings" >> "VehicleSpawn" >> "nightVision") isEqualTo 0) then 
{
	_vehicleObject disableNVGEquipment true;
};
if (getNumber (configFile >> "CfgSettings" >> "VehicleSpawn" >> "thermalVision") isEqualTo 0) then 
{
	_vehicleObject disableTIEquipment true;
};
//private _unmannedVeh = getArray(missionConfigFile >> "cfgUnmanedVehicles" >> "vehicles");
private _unmannedVeh = [
			"B_UAV_01_F",
			"B_UAV_02_F", 
			"B_UAV_02_CAS_F", 
			"O_UAV_01_F",
			"O_UAV_02_F",
			"O_UAV_02_CAS_F", 
			"I_UAV_01_F",
			"I_UAV_02_F",
			"I_UAV_02_CAS_F",
			"B_UGV_01_F",
			"B_UGV_01_rcws_F",  
			"O_UGV_01_F",
			"O_UGV_01_rcws_F", 
			"I_UGV_01_F",
			"I_UGV_01_rcws_F",
			"B_T_UAV_03_F",
			"B_T_UAV_03_dynamicLoadout_F",			
			"CUP_B_USMC_MQ9",
			"CUP_B_Pchela1T_CDF",
			"B_UAV_05_F"
			];
if (_vehicleClassName in _unmannedVeh) then 
{
	createVehicleCrew _vehicleObject;
	//diag_log format["ExileServer_object_vehicle_carefulCreateVehicle:: classname = %1 - is class name an unmanned veh = %2",_vehicleClassName,_vehicleClassName in _unmannedVeh];
	private _grp = createGroup independent;
	(crew _vehicleObject) joinSilent _grp;
};
_vehicleObject
