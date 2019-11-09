  /*
	Name: ExileClient_VirtualGarage_setVehicleName
	By: Ghostridere-GRG-
	Copyright 2019
	Description: Sets both the global variable holding the vehicle name and a local variable on the vehicle
 */
if (_this select 0) then 
{
	_m = "Vehicle nickname updated";
	systemChat _m;
	playSound "scoreAdded";
	["SuccessTitleAndText", ["Success", _m]] call ExileClient_gui_toaster_addTemplateToast;
} else {
  	["ErrorTitleAndText", ["Whoops",format["The Vehicle Could Not Be Renamed"]]] call ExileClient_gui_toaster_addTemplateToast;
};
