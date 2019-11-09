 /*
	Name: ExileClient_Nicknames_updateVehicleName
	By: Ghostridere-GRG-
	Copyright 2019
	Description: updates a global variable holding the current vehicles nickname as entered in the editor
 */
 
 if (isNil "VG_vehicleName") then {VG_vehicleName = ""};
private _display = uiNameSpace getVariable ["vehicleNicknameDialog", displayNull];
private _textEditor = _display displayCtrl 1400;
 VG_vehicleName = ctrlText _textEditor;
systemChat format["vehicle name updated to %1",VG_vehicleName];

 