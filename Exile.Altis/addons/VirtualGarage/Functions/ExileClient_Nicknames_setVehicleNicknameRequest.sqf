  /*
	Name: ExileClient_Nicknames_setVehicleNicknameRequest
	By: Ghostridere-GRG-
	Copyright 2019
	Description: Sets both the global variable holding the vehicle name and a local variable on the vehicle

 */
 private _display = uiNameSpace getVariable ["vehicleNicknameDialog", displayNull];
 private _listBox = _display displayCtrl 1500;
 private _index = lbCurSel 1500;
 private _vehicle = localVehicles select _index;
 _vehicle setPlateNumber VG_vehicleName;
 [format["plate for %1 set to %2",typeOf _vehicle,VG_vehicleName]] call logStuff;
["setVehicleNicknameRequest",[_vehicle,VG_vehicleName]] call ExileClient_system_network_send;
