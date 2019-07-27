  /*
	Name: ExileClient_VirtualGarage_setVehicleName
	By: Ghostridere-GRG-
	Copyright 2019
	Description: Sets both the global variable holding the vehicle name and a local variable on the vehicle
	TODO: 
 */
params["_result"];
_result params["_vehicle","_nickname","_success"];
if (_success) then 
{
	private _m = format["The nickname for your vehicle was updated",typeOf _vehicle,_nickname];
	systemChat _m;
	diag_log _m;
	playSound "scoreAdded";
	["SuccessTitleAndText", ["Success", _m]] call ExileClient_gui_toaster_addTemplateToast;
} else {
  	["ErrorTitleAndText", ["Whoops",format["The Vehicle Could Not Be Renamed"]]] call ExileClient_gui_toaster_addTemplateToast;
};
