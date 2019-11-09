/**
 * ExileClient_gui_traderDialog_show
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_dialog", "_traderName", "_primaryWeaponCheckbox", "_handgunCheckbox", "_storeDropdown", "_storeDropdownSize", "_quantityDropdown", "_purchaseButton", "_sellButton"];
private _traderObject = _this;
ExileClientCurrentTrader = _traderObject getVariable "ExileTraderType";

private _GRG_level7Traders = getArray( missionConfigFile >> "CfgLevel7TradingConfiguration" >> "level7Traders");
private _GRG_level7vehicleTraders = getArray(missionConfigFile>>"CfgLevel7TradingConfiguration">>"level7VehicleTraders");
private _trader = ExileClientCurrentTrader;  
private _isLevel7trader = _trader in _GRG_level7Traders;
if (isNil "GRG_level7timeRemaining") then {diag_log "GRG_level7timeRemaining was found to be nil"; GRG_level7timeRemaining = -1};
//diag_log format["ExileClient_gui_traderDialog_show:  GRG_level7timeRemaining = %1", GRG_level7timeRemaining];
private _isLevel7Player = GRG_level7timeRemaining > 0;
private _level7error = (_isLevel7trader && !(_isLevel7Player));

if (_level7error) exitWith 
{
	playSound "addItemFailed";
	["ErrorTitleAndText", ["ERROR","You must purchase level 7 access to trade here"]] call ExileClient_gui_toaster_addTemplateToast;
};
if (_isLevel7trader) then 
{
	// ["InfoTitleAndText", ["Snap Mode", "Look at the object you want to snap to, press SPACE to lock on it and then move your object next to a snap point. Press SPACE again to place the object."]] call ExileClient_gui_toaster_addTemplateToast;
	["InfoTitleAndText", ["Level 7",format["Level 7 Trading is Active for anoher %1 Hours In-game",GRG_level7timeRemaining / (60 * 60)]]] call ExileClient_gui_toaster_addTemplateToast;

};
private _level7VehicleTraders = getArray(missionConfigFile >> "CfgLevel7TradingConfiguration" >> "level7VehicleTraders");
private _isLevel7VehicleTrader = (_trader in _level7VehicleTraders);

if (_isLevel7Player && _isLevel7VehicleTrader) exitWith 
{
	_traderObject call ExileClient_gui_vehicleTraderDialog_show;
};
disableSerialization;
createDialog "RscExileTraderDialog";
waitUntil { !isNull findDisplay 24007 };
_dialog = uiNameSpace getVariable ["RscExileTraderDialog", displayNull];
uiNameSpace setVariable ["RscExileTraderDialogIsInitialized", false];
_traderName = _dialog displayCtrl 4001;
_traderName ctrlSetText getText(missionConfigFile >> "CfgTraders" >> ExileClientCurrentTrader >> "name");
ctrlSetFocus _traderName;
_primaryWeaponCheckbox = _dialog displayCtrl 4044;
_handgunCheckbox = _dialog displayCtrl 4045;
_storeDropdown = _dialog displayCtrl 4008;
_storeDropdownSize = ctrlPosition _storeDropdown; 
if (getNumber (missionConfigFile >> "CfgTraders" >> ExileClientCurrentTrader >> "showWeaponFilter") isEqualTo 1) then
{
	_primaryWeaponCheckbox ctrlShow true;
	_handgunCheckbox ctrlShow true;
	_storeDropdownSize set [2, 13.2 * (0.025)];
}
else 
{
	_primaryWeaponCheckbox ctrlShow false;
	_handgunCheckbox ctrlShow false;
	_storeDropdownSize set [2, 16.5 * (0.025)];
};
_storeDropdown ctrlSetPosition _storeDropdownSize;
_storeDropdown ctrlCommit 0;
_quantityDropdown = _dialog displayCtrl 4011;
lbClear _quantityDropdown;
_quantityDropdown lbAdd "1x";
_quantityDropdown lbSetCurSel 0;
_quantityDropdown ctrlEnable false;
_purchaseButton = _dialog displayCtrl 4010;
_purchaseButton ctrlEnable false;
_sellButton = _dialog displayCtrl 4007;
_sellButton ctrlEnable false;
true call ExileClient_gui_postProcessing_toggleDialogBackgroundBlur;
call ExileClient_gui_traderDialog_updatePlayerControls;
call ExileClient_gui_traderDialog_updateInventoryDropdown;
call ExileClient_gui_traderDialog_updateInventoryListBox;
call ExileClient_gui_traderDialog_updateStoreDropdown;
call ExileClient_gui_traderDialog_updateStoreListBox;
"" call ExileClient_gui_traderDialog_updateItemStats;
uiNameSpace setVariable ["RscExileTraderDialogIsInitialized", true];
true