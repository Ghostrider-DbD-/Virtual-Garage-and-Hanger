/*

 	Name: ExileClient_VirtualHanger_onStoredVehiclesListSelChanged.sqf
 	Author(s): Shix; modified for Virtual Hanger by Ghostrider [GRG]
    Copyright (c) 2016 Shix
 	Description: Handles Sel changes then shoots your dog

*/
private ["_display","_StoredVehiclesList","_selectedSel","_vehicleSelectedClass","_selectedVehicleDispPic","_vehiclePicture"];
disableSerialization;
_display = uiNameSpace getVariable ["VirtualHangerDialog", displayNull];
_StoredVehiclesList = _display displayCtrl 1500;
_selectedSel = lbCurSel _StoredVehiclesList;
_vehicleSelectedClass = (StoredVehicles select _selectedSel) select 1;
_selectedVehicleDispPic = getText (configfile >> "CfgVehicles" >> _vehicleSelectedClass >> "picture");
_vehiclePicture = _display displayCtrl 1200;
_vehiclePicture ctrlSetText Format["%1",_selectedVehicleDispPic];
