/*

 	Name: ExileClient_VirtualHanger_onStoredVehiclesListSelChanged.sqf
 	Author(s): Shix; modified for Virtual Hanger by Ghostrider [GRG]
    Copyright (c) 2016 Shix
 	Description: Handles Sel changes then shoots your dog

*/
private ["_display","_StoredVehiclesList","_selectedSel","_vehicleSelectedClass","_selectedVehicleDispPic","_vehiclePicture","_nickName"];
disableSerialization;
params["_control","_index"];
_display = uiNameSpace getVariable ["VirtualBoatRackDialog", displayNull];
if !(StoredVehicles isEqualTo []) then 
{
	_StoredVehiclesList = _display displayCtrl 1500;
	_selectedSel = lbCurSel _StoredVehiclesList;
	_vehicleSelectedClass = (StoredVehicles select _selectedSel) select 1;
	_selectedVehicleDispPic = getText (configfile >> "CfgVehicles" >> _vehicleSelectedClass >> "picture");
	_vehiclePicture = _display displayCtrl 1200;
	_vehiclePicture ctrlSetText Format["%1",_selectedVehicleDispPic];
	_nickName = (StoredVehicles select _selectedSel) select 2;
	//diag_log format["_set _nickName: _nickName = %1 | array row = %2",_nickName,StoredVehicles select _selectedSel];
	_storedVehicleNickNameCtrl = _display displayCtrl 1401;
	_storedVehicleNickNameCtrl ctrlSetText _nickName;
};

