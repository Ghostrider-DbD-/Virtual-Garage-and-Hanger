 /*
	Name: ExileClient_VirtualHanger_setVehicleName
	By: Ghostridere-GRG-
	Copyright 2019
	Description: Sets both the global variable holding the vehicle name and a local variable on the vehicle
	TODO: 
 */
 //diag_log format["ExileClient_VirtualHanger_setVehicleName -> called"];
 private _display = uiNameSpace getVariable ["VirtualHangerDialog", displayNull];
 private _listBox = _display displayCtrl 1501;
 private _index = lbCurSel 1501;
 private _vehicle = localVehicles select _index;
["setVehicleNicknameRequest",[_vehicle,VG_vehicleName]] call ExileClient_system_network_send;
