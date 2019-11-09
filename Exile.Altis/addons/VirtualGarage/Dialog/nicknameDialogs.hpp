

////////////////////////////////////////////////////////
// GUI EDITOR OUTPUT START (by Ghostrider, v1.063, #Nisuzu)
////////////////////////////////////////////////////////
class vehicleNicknameDialog
{
    idd = 0720;
    onLoad = "uiNamespace setVariable ['vehicleNicknamedialog', _this select 0]; []spawn ExileClient_Nicknames_onChangeVehicleNicknameDialogLoad;";
    movingenable=false;
	class Controls
	{
		class background: VirtGarageIGUIBack
		{
			idc = 1800;
			x = 0.345313 * safezoneW + safezoneX;
			y = 0.2756 * safezoneH + safezoneY;
			w = 0.315104 * safezoneW;
			h = 0.429 * safezoneH;
			//colorBackground[] = {0,0,0,1};
            colorBackground[] = {0.102,0.102,0.102,1};			
		};
		class localVehicles: VirtGarageRscListbox
		{
			idc = 1500;
			text = "Select a Vehicle"; //--- ToDo: Localize;
			x = 0.540104 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.108854 * safezoneW;
			h = 0.22 * safezoneH;
			colorText[] = {1,1,1,1};
            colorBackground[] = {0.02,0.02,0.02,1};
			onLBSelChanged = "call ExileClient_Nicknames_onNearByVehiclesListSelChanged;";		
		};
		class nicknameEditor: VirtGarageRscEdit
		{
			idc = 1400;
			x = 0.373958 * safezoneW + safezoneX;
			y = 0.599 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
            colorBackground[] = {0.102,0.102,0.102,1};
			onKeyUp = "call ExileClient_Nicknames_updateVehicleName;";			
		};
		class editorLabel: VirtGarageRscStructuredText
		{
			idc = 1000;
			text = "Enter New Nickname Below"; //--- ToDo: Localize;
			x = 0.373958 * safezoneW + safezoneX;
			y = 0.544 * safezoneH + safezoneY;
			w = 0.1375 * safezoneW;
			h = 0.044 * safezoneH;
			colorText[] = {1,1,1,1};
            colorBackground[] = {0.102,0.102,0.102,1};

		};
		class store: VirtGarageRscButton
		{
			idc = 1600;
			text = "Save Nickname"; 
			x = 0.551563 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0859375 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
	        colorBackground[] = {0.102,0.102,0.102,1};
          	onButtonClick = "systemChat 'setName'; call ExileClient_Nicknames_setVehicleNicknameRequest;closeDialog 0;";			
		};
		class vehPic: VirtGarageRscPicture
		{
			idc = 1200;
			text = "\A3\EditorPreviews_F_Exp\Data\CfgVehicles\Land_Addon_05_F.jpg";  //  "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.3625 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.160417 * safezoneW;
			h = 0.22 * safezoneH;
		};
	};
};
