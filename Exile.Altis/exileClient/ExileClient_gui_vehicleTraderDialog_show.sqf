/**
 * ExileClient_gui_vehicleTraderDialog_show
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_traderObject", "_dialog", "_purchaseButton", "_traderCategories", "_categoryComboBox", "_allIndex", "_categoryClass", "_categoryConfig", "_categoryIndex"];
disableSerialization;
_traderObject = _this;
//private _level7 = _traderObject getVariable["level7",false];

if (_traderObject getVariable["level7",false] && (GRG_level7timeRemaining <= 0)) exitWith 
{
	playSound "addItemFailed";
	["ErrorTitleAndText", ["ERROR","You must purchase level 7 access to trade here"]] call ExileClient_gui_toaster_addTemplateToast;
};
if (_traderObject getVariable["level7",false]) then 
{
	["InfoTitleAndText", ["Level 7",format["Level 7 Trading is Active for anoher %1 Hours In-game",(GRG_level7timeRemaining / (60 * 60) toFixed 1]]] call ExileClient_gui_toaster_addTemplateToast;
};
ExileClientCurrentTrader = _this getVariable "ExileTraderType";
ExileClientPinCode = "";
false call ExileClient_gui_hud_toggle;
ExileClientMoonLight setLightBrightness 5;
createDialog "RscExileVehicleTraderDialog";
_dialog = uiNameSpace getVariable ["RscExileVehicleTraderDialog", displayNull];
_purchaseButton = _dialog displayCtrl 4002;
_purchaseButton ctrlEnable false;
_traderCategories = getArray(missionConfigFile >> "CfgTraders" >> ExileClientCurrentTrader >> "categories");
_categoryComboBox = _dialog displayCtrl 4000;
_allIndex = _categoryComboBox lbAdd "";
_categoryComboBox lbSetCurSel _allIndex;
{
	_categoryClass = _x;
	_categoryConfig = missionConfigFile >> "CfgTraderCategories" >> _categoryClass;
	_categoryIndex = _categoryComboBox lbAdd getText(_categoryConfig >> "name");
	_categoryComboBox lbSetData [_categoryIndex, _categoryClass];
	_categoryComboBox lbSetPicture [_categoryIndex, getText(_categoryConfig >> "icon")];
}
forEach _traderCategories;
[""] call ExileClient_gui_vehicleTraderDialog_updateVehicleListBox;
call ExileClient_gui_modelBox_create;