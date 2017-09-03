/*

 	Name: ExileClient_VirtualHanger_AccessHanger.sqf
 	Derived from: ExileClient_AccessGarage.sqf	
 	Author(s): Shix; modified by Ghostrider [GRG] to support Virtual Hanger
    Copyright (c) 2016 Shix
 	Description: Runs some of the dankest checks known to man before allowing a player to access the garage.

*/
diag_log "function ExileClient_AccessHanger called";
 if (ExileClientPlayerIsInCombat) then
{
	  ["Whoops",["You're in combat!"]] call ExileClient_gui_notification_event_addNotification;
} else {
	  createDialog "VirtualHangerDialog";
};
