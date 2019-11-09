/*
    ExileClient_Nicknames_ChangeNickname
*/

private ["_Flag","_BuildRights"];
_playerHasToBeOnFlag = getNumber (missionconfigfile >> "VirtualGarageSettings" >> "VirtualGarage_PlayerHasToBeOnFlag");
_nearbyPortals = nearestObjects[position player,["Land_JetEngineStarter_01_F","Land_Destroyer_01_Boat_Rack_01_F"],3];
_Flag = nearestObject [player, "Exile_Construction_Flag_Static"];
if !(_nearbyPortals isEqualTo []) then // assume there will be none of these near bases.
{
	if (ExileClientPlayerIsInCombat) then
	{
		["ErrorTitleAndText", ["Whoops",format["You're in combat!"]]] call ExileClient_gui_toaster_addTemplateToast;
	} else {
		createDialog "vehicleNicknameDialog";
	};
} else {
	if(_playerHasToBeOnFlag == 1)then
	{
		_BuildRights = _Flag getVariable ["ExileTerritoryBuildRights", []];
		if(getPlayerUID player in _BuildRights) then
		{
			if (ExileClientPlayerIsInCombat) then
			{
				["ErrorTitleAndText", ["Whoops",format["You're in combat!"]]] call ExileClient_gui_toaster_addTemplateToast;
			} else {
				createDialog "vehicleNicknameDialog";
			}
		} else {
			["ErrorTitleAndText", ["Whoops",format["You Do Not have access to this Garage"]]] call ExileClient_gui_toaster_addTemplateToast;
		};
	};
};