/**
 * ExileServer_system_trading_network_wasteDumpRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID", "_parameters", "_vehicleNetID", "_mode", "_vehicleObject", "_vehicleDBID", "_playerObject", "_cargo", "_revenue", "_playerMoney", "_respectGain", "_playerRespect", "_logging", "_traderLog", "_responseCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_vehicleNetID = _parameters select 0;
_mode = _parameters select 1;

_fn_sellVehicleInventory = {
	params["_vehicleObject"];
	private["_cargo","_revenue"];
	//standard sell vehicle cargo
	_cargo = _vehicleObject call ExileClient_util_containerCargo_list;
	_revenue = _cargo call ExileClient_util_gear_calculateTotalSellPrice;
	clearBackpackCargoGlobal _vehicleObject;
	clearItemCargoGlobal _vehicleObject;
	clearMagazineCargoGlobal _vehicleObject;
	clearWeaponCargoGlobal _vehicleObject;
	_vehicleObject call ExileServer_object_vehicle_database_update;
	//diag_log format["_fn_sellVehicleInventory:: returning value for revenue of %1",_revenue];
	_revenue
};

_fn_sellCrateContents = {
	params["_veh"];
	private["_cargo","_revenue","_attachedCrates"];
	_revenue = 0;
	{
		//diag_log format["--<> Evaluating cargo item %1",  _x];
		_cargo = _x call ExileClient_util_containerCargo_list;
		_revenue = _revenue + (_cargo call ExileClient_util_gear_calculateTotalSellPrice);
		_revenue = _revenue + ([(typeOf _x)] call ExileClient_util_gear_calculateTotalSellPrice);  //  In case we ever put a price on crates.
		clearBackpackCargoGlobal _x;
		clearItemCargoGlobal _x;
		clearMagazineCargoGlobal _x;
		clearWeaponCargoGlobal _x;
		detach _x;
		deleteVehicle _x;
		//diag_log format["_fn_sellCrateContents:: returning value for revenue of %1",_revenue];
	}forEach (_veh getVariable ["R3F_LOG_objets_charges", []]);	
	_veh setVariable ["R3F_LOG_objets_charges",[],true];
	
	_attachedCrates = attachedObjects _veh;
	if (count (_attachedCrates) > 0) then  // If crates are attached sell their contents and delete them
	{
		{
			//diag_log format["--<> Evaluating cargo item %1",  _x];
			_cargo = _x call ExileClient_util_containerCargo_list;
			_revenue = _revenue + (_cargo call ExileClient_util_gear_calculateTotalSellPrice);
			_revenue = _revenue + ([(typeOf _x)] call ExileClient_util_gear_calculateTotalSellPrice);  //  In case we ever put a price on crates.
			
			clearBackpackCargoGlobal _x;
			clearItemCargoGlobal _x;
			clearMagazineCargoGlobal _x;
			clearWeaponCargoGlobal _x;
			detach _x;
			deleteVehicle _x;
			//diag_log format["_fn_sellCrateContents:: returning value for revenue of %1",_revenue];
		}forEach _attachedCrates; // getVariable ["R3F_LOG_objets_charges", []]);
	};
	
	[_veh,true] call IL_Init_Veh;

	_revenue
};



try 
{
	_vehicleObject = objectFromNetId _vehicleNetID;
	_vehicleDBID = _vehicleObject getVariable "ExileDatabaseID";
	if (isNull _vehicleObject) then
	{
		throw 6;
	};
	if (_vehicleObject getVariable ["ExileMutex", false]) then
	{
		throw 12;
	};
	_vehicleObject setVariable ["ExileMutex", true];
	_playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
	if (isNull _playerObject) then
	{
		throw 1;
	};
	if !(alive _playerObject) then
	{
		throw 2;
	};
	if !((owner _vehicleObject) isEqualTo (owner _playerObject)) then 
	{
		throw 6;
	};

	_cargo = [];
	_revenue = 0;
	
	if(_mode isEqualTo 1) then 
	{
		_revenue = [_vehicleObject] call _fn_sellVehicleInventory;
	};
	if(_mode isEqualTo 2) then
	{
		// sell contents of any loaded crates

		//diag_log format["wasteDumpRequest:: Mod #3->>  cargo for vehicle %1 cargo is %2",_vehicleObject, attachedObjects _vehicleObject];
		//diag_log format["wasteDumpRequest:: Mode #3->> R3F_LOG_objets_charges for vehicle %1 = %2",_vehicleObject,_vehicleObject getVariable ["R3F_LOG_objets_charges",[]]];
		_revenue = [_vehicleObject] call _fn_sellCrateContents;
		//diag_log format["wasteDumpRequest:: ->> Revenue after sale of crates = %1",_revenue];	
	};
	if (_mode isEqualTo 3) then
	{
		//_attachedCrates = attachedObjects _vehicleObject;
		//diag_log format["wasteDumpRequest:: Mod #3->>  cargo for vehicle %1 cargo is %2",_vehicleObject, attachedObjects _vehicleObject];
		//diag_log format["wasteDumpRequest:: Mode #3->> R3F_LOG_objets_charges for vehicle %1 = %2",_vehicleObject,_vehicleObject getVariable ["R3F_LOG_objets_charges",[]]];
		_revenue = [_vehicleObject] call _fn_sellCrateContents;
		//diag_log format["wasteDumpRequest:: Mod #3->> Revenue after sale of crates = %1",_revenue];		
		_revenue = _revenue + ([_vehicleObject] call _fn_sellVehicleInventory);
		//diag_log format["wasteDumpRequest:: Mod #3->> Revenue after sale of inventory = %1",_revenue];	
		//diag_log format["wasteDumpRequest:: Mod #3->>Sale price of vehicle = %1",([(typeOf _vehicleObject)] call ExileClient_util_gear_calculateTotalSellPrice)];
		_revenue = _revenue + ([(typeOf _vehicleObject)] call ExileClient_util_gear_calculateTotalSellPrice);
		//diag_log format["wasteDumpRequest:: Mod #3->> Revenue after sale of vehicle = %1",_revenue];	
		_vehicleObject call ExileServer_object_vehicle_remove;
		deleteVehicle _vehicleObject;
	};

	_playerMoney = _playerObject getVariable ["ExileMoney", 0];
	_playerMoney = _playerMoney + _revenue;
	_playerObject setVariable ["ExileMoney", _playerMoney, true];
	format["setPlayerMoney:%1:%2", _playerMoney, _playerObject getVariable ["ExileDatabaseID", 0]] call ExileServer_system_database_query_fireAndForget;
	_respectGain = _revenue * getNumber (configFile >> "CfgSettings" >> "Respect" >> "tradingRespectFactor");
	//diag_log format["wasteDumpRequest:: Total Revenue = %1 while Respect Gained = %2,"_revenue,_respectGain];	
	_playerRespect = _playerObject getVariable ["ExileScore", 0];
	_playerRespect = floor (_playerRespect + _respectGain);
	_playerObject setVariable ["ExileScore", _playerRespect];
	format["setAccountScore:%1:%2", _playerRespect, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
	[_sessionID, "wasteDumpResponse", [0, _revenue, str _playerRespect]] call ExileServer_system_network_send_to;
	_logging = getNumber(configFile >> "CfgSettings" >> "Logging" >> "traderLogging");
	if (_logging isEqualTo 1) then
	{
		_traderLog = format ["PLAYER: ( %1 ) %2 SOLD ITEM: %3 (ID# %4) with Cargo %5 FOR %6 POPTABS AND %7 RESPECT | PLAYER TOTAL MONEY: %8",getPlayerUID _playerObject,_playerObject,typeOf _vehicleObject,_vehicleDBID,_cargo,_revenue,_respectGain,_playerMoney];
		"extDB3" callExtension format["1:TRADING:%1",_traderLog];
	};
}
catch
{
	_responseCode = _exception;
	[_sessionID, "wasteDumpResponse", [_responseCode, 0, ""]] call ExileServer_system_network_send_to;
};
if (!isNull _vehicleObject) then
{
	_vehicleObject setVariable ["ExileMutex", false];
};
true
