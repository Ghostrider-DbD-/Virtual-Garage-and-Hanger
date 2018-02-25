/*

 	Name: ExileClient_VirtualGarge_StoreVehicleRequest.sqf
 	Author(s): Shix
    Copyright (c) 2016 Shix
 	Description: Handles the client Storing a vehicle in the virtual garage.
	Modified by Ghostrider[GRG]
*/
private ["_display","_flag","_ownerUID","_level","_vehicleLimit","_storedVehiclesCount","_NearByVehiclesList","_selectedSel","_VehNetId"];
disableSerialization;
_display = uiNameSpace getVariable ["VirtualGarageDialog", displayNull];
_flag = nearestObject [player, "Exile_Construction_Flag_Static"];
_ownerUID = _flag getVariable ["ExileOwnerUID", ""];
_level = _flag getVariable ["ExileTerritoryLevel", 0];
_myArray = getArray(missionConfigFile  >> "VirtualGarageSettings" >> "myArray");
_VG_flagLimits = getArray(missionConfigFile  >> "VirtualGarageSettings" >> "VirtualGarage_FlagLevelLimits");
_configsAreArray = isArray (missionConfigFile  >> "VirtualGarageSettings" >> "VirtualGarage_FlagLevelLimits");
if (_configsAreArray) then
{
	VG_vehicleLimit = _VG_flagLimits select (_level - 1);
} else {
	VG_vehicleLimit = 10 + (_level * 3);
};
//_msg = format["_configsAreArray = %3 || _vehiclesLimit = %1 || count StoredVehicles = %2",_VG_flagLimits, count StoredVehicles, _configsAreArray];
//systemChat format["_myArray = %1",_myArray];
//systemChat _msg;
//diag_log _msg;
_storedVehiclesCount = count StoredVehicles;

if (_storedVehiclesCount < VG_vehicleLimit) then {
  _NearByVehiclesList = _display displayCtrl 1501;
  _selectedSel = lbCurSel _NearByVehiclesList;
  _VehNetId = _NearByVehiclesList lbData _selectedSel;
  ["StoreVehicleRequest",[_VehNetId,_ownerUID]] call ExileClient_system_network_send;
}
else
{
  (findDisplay 0720) closeDisplay 0;
  //["Whoops",[format["You Already Have Too Many Vehicles For Your Flag Level"]]] call ExileClient_gui_notification_event_addNotification;
  ["ErrorTitleAndText", ["Whoops",format["You Already Have Too Many Vehicles For Your Flag Level"]]] call ExileClient_gui_toaster_addTemplateToast;  
}
