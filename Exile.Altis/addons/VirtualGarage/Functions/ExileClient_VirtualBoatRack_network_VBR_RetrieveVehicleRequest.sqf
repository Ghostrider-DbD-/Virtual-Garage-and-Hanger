/*

 	Name: ExileClient_VirtualGarge_RetrieveVehicleRequest.sqf
 	Author(s): Shix; modified by Ghostrider [GRG] to support Virtual Hangers
    Copyright (c) 2016 Shix
 	Description: Handles the client Retrival a vehicle from the virtual garage.

*/
private ["_display","_StoredVehiclesList","_selectedSel","_VehID"];
_display = uiNameSpace getVariable ["VirtualBoatRackDialog", displayNull];
_StoredVehiclesList = _display displayCtrl 1500;
_selectedSel = lbCurSel _StoredVehiclesList;
_VehID = _StoredVehiclesList lbData _selectedSel;
["RetrieveVehicleRequest",[_VehID]] call ExileClient_system_network_send;
