 /*
	Name: ExileClient_VirtualHanger_updateVehicleName
	By: Ghostridere-GRG-
	Copyright 2019
	Description: updates a global variable holding the current vehicles nickname as entered in the editor
	TODO: set up network call to set the variable on the vehicle so battleye exceptions are not needed.
 */if (isNil "VG_vehicleName") then {VG_vehicleName = ""};
private _display = uiNameSpace getVariable ["VirtualHangerDialog", displayNull];
private _textEditor = _display displayCtrl 1400;
 VG_vehicleName = ctrlText _textEditor;


 