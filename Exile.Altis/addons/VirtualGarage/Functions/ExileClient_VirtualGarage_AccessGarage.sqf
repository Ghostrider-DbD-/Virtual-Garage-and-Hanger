/*

 	Name: ExileClient_AccessGarage.sqf
 	Author(s): Shix
    Copyright (c) 2016 Shix
 	Description: Runs some of the dankest checks known to man before allowing a player to access the garage.

*/
private ["_Flag","_BuildRights"];
_playerHasToBeOnFlag = getNumber (missionconfigfile >> "VirtualGarageSettings" >> "VirtualGarage_PlayerHasToBeOnFlag");
_fn_hideControls = {
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

if(_playerHasToBeOnFlag == 1)then
{
  _Flag = nearestObject [player, "Exile_Construction_Flag_Static"];
  _BuildRights = _Flag getVariable ["ExileTerritoryBuildRights", []];
  if(getPlayerUID player in _BuildRights) then
  {
    if (ExileClientPlayerIsInCombat) then
    {
          //["Whoops",["You're in combat!"]] call ExileClient_gui_notification_event_addNotification;
		  ["ErrorTitleAndText", ["Whoops",format["You're in combat!"]]] call ExileClient_gui_toaster_addTemplateToast;
    } else {
        createDialog "VirtualGarageDialog";
        [] call _fn_hideControls;
    }
  } else {
    //["Whoops",["You Do Not have access to this Garage"]] call ExileClient_gui_notification_event_addNotification;
	["ErrorTitleAndText", ["Whoops",format["You Do Not have access to this Garage"]]] call ExileClient_gui_toaster_addTemplateToast;
  };
}
else
{
  createDialog "VirtualGarageDialog";
  [] call _fn_hideControls;
};
