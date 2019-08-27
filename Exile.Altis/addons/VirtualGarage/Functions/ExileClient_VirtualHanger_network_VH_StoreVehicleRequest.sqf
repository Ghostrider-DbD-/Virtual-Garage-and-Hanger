/*

 	Name: ExileClient_VirtualHanger_StoreVehicleRequest.sqf
 	Author(s): Shix; modified for Virtual Hanger by Ghostrider [GRG]
    Copyright (c) 2016 Shix
 	Description: Handles the client Storing a vehicle in the virtual garage.

*/
private ["_display","_flag","_ownerUID","_level","_vehicleLimit","_storedVehiclesCount","_NearByVehiclesList","_selectedSel","_VehNetId"];
disableSerialization;
_display = uiNameSpace getVariable ["VirtualHangerDialog", displayNull];
_ownerUID = getPlayerUID player;
if (true) then {
  _NearByVehiclesList = _display displayCtrl 1501;
  _selectedSel = lbCurSel _NearByVehiclesList;
  _VehNetId = _NearByVehiclesList lbData _selectedSel;
  diag_log format["ExileClient_VirtualHanger_StoreVehicleRequest: _display = %1 | _selectedSel = %2 | _VehNetId = %3",_display,_selectedSel,_VehNetId];
  ["VH_StoreVehicleRequest",[_VehNetId,_ownerUID,VG_vehicleName]] call ExileClient_system_network_send;
}
else
{
  (findDisplay 0720) closeDisplay 0;
  //["Whoops",[format["You Already Have Too Many Vehicles For Your Flag Level"]]] call ExileClient_gui_notification_event_addNotification;
  ["ErrorTitleAndText", ["Whoops",format["You have already stored the maximum number of vehicles allowed for your flag level!"]]] call ExileClient_gui_toaster_addTemplateToast;
}

