 /*
	Name: ExileClient_VirtualBoatRack_updateVehicleName
	By: Ghostridere-GRG-
	Copyright 2019
	Description: updates a global variable holding the current vehicles nickname as entered in the editor
 */if (isNil "VG_vehicleName") then {VG_vehicleName = ""};
private _display = uiNameSpace getVariable ["VirtualBoatRackDialog", displayNull];
private _textEditor = _display displayCtrl 1400;
 VG_vehicleName = ctrlText _textEditor;


 