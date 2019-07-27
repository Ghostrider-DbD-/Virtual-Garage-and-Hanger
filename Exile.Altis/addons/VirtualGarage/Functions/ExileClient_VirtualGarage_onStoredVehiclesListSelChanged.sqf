/*

 	Name: ExileClient_VirtualGarage_onStoredVehiclesListSelChanged.sqf
 	Author(s): Shix
    Copyright (c) 2016 Shix
 	Description: Handles Sel changes then shoots your dog
	Updated by Ghostrider-GRG to use data passed by the event handler as parameters and to consider vehicle nicknames.
*/
// Control idc 1500
private ["_display","_StoredVehiclesList","_selectedSel","_vehicleSelectedClass","_selectedVehicleDispPic","_vehiclePicture","_nickName"];
disableSerialization;
params["_control","_index"];
_display = uiNameSpace getVariable ["VirtualGarageDialog", displayNull];
if !(StoredVehicles isEqualTo []) then 
{
	_StoredVehiclesList = _display displayCtrl 1500;
	_selectedSel = lbCurSel _StoredVehiclesList;
	_vehicleSelectedClass = (StoredVehicles select _selectedSel) select 1;
	_selectedVehicleDispPic = getText (configfile >> "CfgVehicles" >> _vehicleSelectedClass >> "picture");
	_vehiclePicture = _display displayCtrl 1200;
	_vehiclePicture ctrlSetText Format["%1",_selectedVehicleDispPic];
	_nickName = (StoredVehicles select _selectedSel) select 2;
	_storedVehicleNickNameCtrl = _display displayCtrl 1401;
	_storedVehicleNickNameCtrl ctrlSetText _nickName;
};



