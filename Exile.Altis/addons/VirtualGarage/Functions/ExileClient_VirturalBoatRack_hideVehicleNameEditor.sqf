 /*
	Name: ExileClient_VirtualBoatRack_hideVehicleNameEditor
	By: Ghostridere-GRG-
	Copyright 2019
	Description: Sets which controls are shown/hidden when selecting vehicles from the near vehicles list.
	TODO: 
 */
ctrlShow [1400,false];
ctrlShow [1020,false];
ctrlShow [1601,false];
ctrlShow [1608,false];
ctrlShow [1106,false];
ctrlShow [1105,true];
ctrlShow [1606,true];
ctrlShow [1401,true];
ctrlShow [1021,true];
ctrlShow [1102,false];
ctrlShow [1107,true];
 private _display = uiNameSpace getVariable ["VirtualBoatRackDialog", displayNull];
 private _directions = _display displayCtrl 1103;
 disableSerialization;
_directions ctrlSetText "Select A Vehicle To Store";
