/*

 	Name: ExileClient_VirtualBoatRack_AccessBoatRack.sqf
 	Derived from: ExileClient_AccessGarage.sqf	
 	Author(s): Shix; modified by Ghostrider [GRG] to support Virtual Hanger
    Copyright (c) 2016 Shix
 	Description: Runs some of the dankest checks known to man before allowing a player to access the garage.

*/

 if (ExileClientPlayerIsInCombat) then
{
	  //["Whoops",["You're in combat!"]] call ExileClient_gui_notification_event_addNotification;
	  ["ErrorTitleAndText", ["Whoops",format["You're in combat!"]]] call ExileClient_gui_toaster_addTemplateToast;
} else {
	createDialog "VirtualBoatRackDialog";
  	ctrlShow [1400,false];
	ctrlShow [1020,false];
	ctrlShow [1600,true];
	ctrlShow [1608,false];
	ctrlShow [1606,false];
	ctrlShow [1401,false];
	ctrlShow [1021,false];
	ctrlShow [1103,true];
	ctrlShow [1601,false];  
	ctrlShow [1106,false];
	ctrlShow [1107,false];
	ctrlShow [1102,false];     	  
};
