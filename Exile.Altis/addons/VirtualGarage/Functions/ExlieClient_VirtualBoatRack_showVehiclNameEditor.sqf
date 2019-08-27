 /*
	Name: ExileClient_VirtualBoatRack_showVehicleNameEditor
	By: Ghostridere-GRG-
	Copyright 2019
	Description: Sets which controls are shown/hidden when selecting vehicles from the stored vehicles list.
	TODO: 
 */
ctrlShow [1400,true];
ctrlShow [1020,true];
ctrlShow [1601,true];
ctrlShow [1608,true];
ctrlShow [1106,true];
ctrlShow [1105,true];
ctrlShow [1606,false];
ctrlShow [1401,false];
ctrlShow [1021,false];
ctrlShow [1102,false];
ctrlShow [1107,false];
 private _display = uiNameSpace getVariable ["VirtualBoatRackDialog", displayNull];
 private _directions = _display displayCtrl 1103;
 disableSerialization;
_directions ctrlSetText "Select A Vehicle To Retrieve";
   