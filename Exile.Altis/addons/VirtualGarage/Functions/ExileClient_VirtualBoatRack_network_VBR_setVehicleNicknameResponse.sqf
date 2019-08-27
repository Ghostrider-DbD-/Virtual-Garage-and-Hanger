  /*
	Name: ExileClient_VirtualHanger_setVehicleNameResponse
	By: Ghostridere-GRG-
	Copyright 2019
	Description: Notifies player that server sucessfully changed the vehicle nickname
	TODO: 
 */
params["_vehicle","_result"];
private _m = format["The nickname for your %1 was set to %2",typeOf _vehicle,_result];
systemChat _m;
["SuccessTitleAndText", ["Success", _m]] call ExileClient_gui_toaster_addTemplateToast;
