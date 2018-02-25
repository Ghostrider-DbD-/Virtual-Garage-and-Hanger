/*

 	Name: ExileClient_VirtualGarage_network_StoreVehicleResponse.sqf
 	Author(s): Shix
    Copyright (c) 2016 Shix and WolfkillArcadia
 	Description: Handles the client Storing a vehicle in the virtual garage.

*/
private ["_response","_this"];
_response = _this select 0;
if(_response == "true")then
{
  //["Success",[format["Vehicle Successfully Stored"]]] call ExileClient_gui_notification_event_addNotification;
  ["SuccessTitleAndText", ["Success", format["Your vehicle has been stored in the virtual garage."]]] call ExileClient_gui_toaster_addTemplateToast;
  private _msg = format["%1 Slots Used and %2 Slots Remaining",(count StoredVehicles) + 1, VG_vehicleLimit - ((count StoredVehicles) + 1)];
  ["SuccessTitleAndText", ["Success", _msg]] call ExileClient_gui_toaster_addTemplateToast;
}
else
{
  //["Whoops",[format["The Vehicle Could Not Be Stored"]]] call ExileClient_gui_notification_event_addNotification;
  ["ErrorTitleAndText", ["Whoops",format["The Vehicle Could Not Be Stored"]]] call ExileClient_gui_toaster_addTemplateToast;
};
(findDisplay 0720) closeDisplay 0;
