 /*
	Name: ExileClient_VirtualGarage_updateVehicleName
	By: Ghostridere-GRG-
	Copyright 2019
	Description: Sets both the global variable holding the vehicle name and a local variable on the vehicle
	TODO: set up network call to set the variable on the vehicle so battleye exceptions are not needed.
 */
 if (isNil "VG_vehicleName") then {VG_vehicleName = ""};
private _display = uiNameSpace getVariable ["VirtualGarageDialog", displayNull];
private _textEditor = _display displayCtrl 1400;
 VG_vehicleName = ctrlText _textEditor;


 