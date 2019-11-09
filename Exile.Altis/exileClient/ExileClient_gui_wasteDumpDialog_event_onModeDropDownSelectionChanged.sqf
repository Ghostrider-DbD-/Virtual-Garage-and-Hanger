/**
 * ExileClient_gui_wasteDumpDialog_event_onModeDropDownSelectionChanged
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_display","_dropdown","_index","_vehicleObject","_mode","_cargo","_revenue","_revenueControl","_sellButton"];
disableSerialization;
_fn_calculateValueLoadedCratesAndContents = {
	params["_veh"];
	private["_revenue","_cargo"];
	diag_log format["_fn_calculateValueLoadedCratesAndContents:-> attachedObjects for vehicle %1 = %2",_veh, attachedObjects _veh];
	diag_log format["R3F_LOG_objets_charges for vehicle %1 = %2",_veh, _veh getVariable["R3F_LOG_objets_charges",[]]];
	
	_revenue = 0;
	
	{
		_cargo = _x call ExileClient_util_containerCargo_list;
		_revenue = _revenue + (_cargo call ExileClient_util_gear_calculateTotalSellPrice);
		_revenue = _revenue + ([(typeOf _x)] call ExileClient_util_gear_calculateTotalSellPrice);
	}forEach (_veh getVariable ["R3F_LOG_objets_charges",[]]);		
	{
		_cargo = _x call ExileClient_util_containerCargo_list;
		_revenue = _revenue + (_cargo call ExileClient_util_gear_calculateTotalSellPrice);
		_revenue = _revenue + ([(typeOf _x)] call ExileClient_util_gear_calculateTotalSellPrice);
	}forEach attachedObjects _veh;	
	_revenue
};

_display = uiNameSpace getVariable ["RscExileWasteDumpDialog", displayNull];
_dropdown = _this select 0;
_index = _this select 1;
_vehicleObject = objectFromNetId (_dropdown lbData _index);
if (isNull _vehicleObject) then
{
	closeDialog 0;
}
else 
{
	_mode = _dropdown lbValue _index;
	_cargo = [];
	_revenue = 0;
	
	//Mode 1: Selling loaded items and contents
	if (_mode isEqualTo 1) then {
		_cargo = _vehicleObject call ExileClient_util_containerCargo_list;
		_revenue = _cargo call ExileClient_util_gear_calculateTotalSellPrice;
	};
	//Mode 2: Sell IL_Load and R3F Items
	if (_mode isEqualTo 2) then {
		_revenue = [_vehicleObject] call _fn_calculateValueLoadedCratesAndContents;
	};
	//Mode 3: Sell regular vehicle inventory
	if (_mode isEqualTo 3) then {
		_cargo = _vehicleObject call ExileClient_util_containerCargo_list;
		_revenue = _revenue + (_cargo call ExileClient_util_gear_calculateTotalSellPrice);
		_revenue = _revenue + ([_vehicleObject] call _fn_calculateValueLoadedCratesAndContents);
		_revenue = _revenue + ([(typeOf _vehicleObject)] call ExileClient_util_gear_calculateTotalSellPrice);
	};
	_revenueControl = _display displayCtrl 4001;
	_revenueControl ctrlSetStructuredText (parseText (format ["<t size='1.4'>%1<img image='\exile_assets\texture\ui\poptab_notification_ca.paa' size='1' shadow='true' /></t>", _revenue]));
	_sellButton = _display displayCtrl 4000;
	_sellButton ctrlEnable true;
};
true