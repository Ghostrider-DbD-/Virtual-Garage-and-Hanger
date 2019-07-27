  /*
	Name: ExileClient_VirtualHanger_network_setVehicleNameRequest
	By: Ghostridere-GRG-
	Copyright 2019
	Description: Sets both the global variable holding the vehicle name and a local variable on the vehicle
	TODO: 
 */
 private _display = uiNameSpace getVariable ["VirtualHangerDialog", displayNull];
 private _listBox = _display displayCtrl 1501;
 private _index = lbCurSel 1501;
 private _vehicle = localVehicles select _index;
["setVehicleNicknameRequest",[_vehicle,VH_vehicleName]] call ExileClient_system_network_send;
