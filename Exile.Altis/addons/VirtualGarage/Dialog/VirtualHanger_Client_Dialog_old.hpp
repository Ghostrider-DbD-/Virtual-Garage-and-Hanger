/*

 	Name: VirtualHanger_Client_Dialog.hpp
 	Author(s): Shix
  Copyright (c) 2016 Shix
  Description: Dialog file for Virtual Hanger

*/
class VirtualHangerDialog
{
    idd = 0720;
    //onLoad = "diag_log 'Virtual Hanger Client Loaded'; uiNamespace setVariable ['VirtualGarageDialog', _this select 0]; []spawn ExileClient_VirtualGarage_onVirtualGarageDialogLoad;";
	onLoad = "uiNamespace setVariable ['VirtualHangerDialog', _this select 0]; []spawn ExileClient_VirtualHanger_onVirtualHangerDialogLoad;";
    movingenable=false;
	class Controls
	{
        class VirtHangerBackPannel: VirtGarageIGUIBack
        {
        	idc = 2200;
        	x = -0.000287468 * safezoneW + safezoneX;
        	y = -0.00599988 * safezoneH + safezoneY;
        	w = 1.00056 * safezoneW;
        	h = 1.012 * safezoneH;
            colorBackground[] = {0.169,0.188,0.212,1};
        };
        class VirtHangerFrontPannel: VirtGarageIGUIBack
        {
        	idc = 2202;
        	x = 0.293698 * safezoneW + safezoneX;
        	y = -0.00599999 * safezoneH + safezoneY;
        	w = 0.412603 * safezoneW;
        	h = 1.045 * safezoneH;
            colorBackground[] = {0.239,0.275,0.302,1};
        };
        class VirtHangerTopBar: VirtGarageIGUIBack
        {
        	idc = 2201;
        	x = -0.000281541 * safezoneW + safezoneX;
        	y = -0.00599999 * safezoneH + safezoneY;
        	w = 1.00572 * safezoneW;
        	h = 0.022 * safezoneH;
            colorBackground[] = {0.102,0.102,0.102,1};
        };
        class VirtHangerBottomBar: VirtGarageIGUIBack
        {
        	idc = 2203;
        	x = -0.000281541 * safezoneW + safezoneX;
        	y = 0.093 * safezoneH + safezoneY;
        	w = 1.00572 * safezoneW;
        	h = 0.009 * safezoneH;
            colorBackground[] = {0.102,0.102,0.102,1};
        };
        class VirtHangerStoredVehiclesTitle: VirtGarageRscStructuredText
        {
            idc = 1100;
            x = -0.000281689 * safezoneW + safezoneX;
            y = 0.033 * safezoneH + safezoneY;
            w = 0.29398 * safezoneW;
            h = 0.055 * safezoneH;
        };
        class VirtHangerTitle: VirtGarageRscStructuredText
        {
        	idc = 1101;
        	x = 0.298856 * safezoneW + safezoneX;
        	y = 0.033 * safezoneH + safezoneY;
        	w = 0.402288 * safezoneW;
        	h = 0.055 * safezoneH;
        };
        class VirtHangerBallance: VirtGarageRscStructuredText
        {
        	idc = 1102;
        	x = 0.706302 * safezoneW + safezoneX;
        	y = 0.033 * safezoneH + safezoneY;
        	w = 0.29398 * safezoneW;
        	h = 0.055 * safezoneH;
        };
        class ScreenBorderLeft: VirtGarageIGUIBack
        {
        	idc = 2210;
        	x = 0.292698 * safezoneW + safezoneX;
        	y = 0.093 * safezoneH + safezoneY;
        	w = 0.00212603 * safezoneW;
        	h = 0.954 * safezoneH;
            colorBackground[] = {0.102,0.102,0.102,1};
        };
        class ScreenBorderRight: VirtGarageIGUIBack
        {
        	idc = 2204;
        	x = 0.706302 * safezoneW + safezoneX;
        	y = 0.093 * safezoneH + safezoneY;
        	w = 0.00212603 * safezoneW;
        	h = 0.954 * safezoneH;
            colorBackground[] = {0.102,0.102,0.102,1};
        };
        class VirtHangerCloseText: VirtGarageRscStructuredText
        {
        	idc = 1105;
            text = "<t color='#00b2cd' font='OrbitronLight' size='2' valign='middle' align='center' shadow='0'>CLOSE</t>";
        	x = 0.407164 * safezoneW + safezoneX;
        	y = 0.885 * safezoneH + safezoneY;
        	w = 0.185671 * safezoneW;
        	h = 0.055 * safezoneH;
        };
        class VirtHangerCloseBtn: VirtGarageRscButton
        {
        	idc = 1600;
        	x = 0.407164 * safezoneW + safezoneX;
        	y = 0.880 * safezoneH + safezoneY;
        	w = 0.185671 * safezoneW;
        	h = 0.055 * safezoneH;
            colorBackground[] = {0,0,0,0};
            colorBackgroundActive[] ={1,1,1,0.05};
            colorFocused[] ={1,1,1,0};
            onButtonClick = "((ctrlParent (_this select 0)) closeDisplay 0720);";
        };
        class VirtHangerStoredVehiclesList: VirtGarageRscListbox
        {
        	idc = 1500;
        	x = 0.0255062 * safezoneW + safezoneX;
        	y = 0.159 * safezoneH + safezoneY;
        	w = 0.237247 * safezoneW;
        	h = 0.792 * safezoneH;
          style = 530;
          onLBSelChanged = "call ExileClient_VirtualHanger_onStoredVehiclesListSelChanged";
        };
        class VirtHangerNearVehiclesList: VirtGarageRscListbox
        {
        	idc = 1501;
        	x = 0.737247 * safezoneW + safezoneX;
        	y = 0.159 * safezoneH + safezoneY;
        	w = 0.237247 * safezoneW;
        	h = 0.792 * safezoneH;
          style = 530;
          onLBSelChanged = "call ExileClient_VirtualHanger_onNearByVehiclesListSelChanged";
        };
        class VirtHangerCarPic: VirtGarageRscPicture
        {
        	idc = 1200;
        	text = "#(argb,8,8,3)color(1,1,1,1)";
        	x = 0.407164 * safezoneW + safezoneX;
        	y = 0.148 * safezoneH + safezoneY;
        	w = 0.185671 * safezoneW;
        	h = 0.231 * safezoneH;
        };
        class VirtHangerLoadingBar: VirtGarageRscProgress
        {
          idc = 1900;
          x = 0.299398 * safezoneW + safezoneX;
          y = 0.742 * safezoneH + safezoneY;
          w = 0.402603 * safezoneW;
          h = 0.020 * safezoneH;
        };
        class VirtHangerLoading: VirtGarageRscStructuredText
        {
            idc = 1120;
            x = 0.298856 * safezoneW + safezoneX;
            y = 0.690 * safezoneH + safezoneY;
            w = 0.402288 * safezoneW;
            h = 0.055 * safezoneH;
        };
        class VirtHangerStoreBtnText: VirtGarageRscStructuredText
        {
        	idc = 1106;

        	text = "<t color='#00b2cd' font='OrbitronLight' size='2' valign='middle' align='center' shadow='0'>STORE</t>"; 
        	x = 0.407212 * safezoneW + safezoneX;
        	y = 0.445 * safezoneH + safezoneY;
        	w = 0.185671 * safezoneW;
        	h = 0.055 * safezoneH;
        };
        class VirtHangerStoreBtn: VirtGarageRscButton
        {
        	idc = 1608;
        	colorBackgroundActive[] = {1,1,1,0.05};
        	colorFocused[] = {1,1,1,0};

        	x = 0.407212 * safezoneW + safezoneX;
        	y = 0.440 * safezoneH + safezoneY;
        	w = 0.185671 * safezoneW;
        	h = 0.055 * safezoneH;
        	colorBackground[] = {0,0,0,0};
          onButtonClick = "call ExileClient_VirtualHanger_network_StoreVehicleRequest";
        };
        class VirtHangerRetrieveBtnText: VirtGarageRscStructuredText
        {
        	idc = 1107;
        	text = "<t color='#00b2cd' font='OrbitronLight' size='2' valign='middle' align='center' shadow='0'>RETRIEVE</t>"; //--- ToDo: Localize;
        	x = 0.407212 * safezoneW + safezoneX;
        	y = 0.533 * safezoneH + safezoneY;
        	w = 0.185671 * safezoneW;
        	h = 0.055 * safezoneH;
        };
        class VirtHangerRetrieveBtn: VirtGarageRscButton
        {
        	idc = 1606;
        	colorBackgroundActive[] = {1,1,1,0.05};
        	colorFocused[] = {1,1,1,0};

        	x = 0.407212 * safezoneW + safezoneX;
        	y = 0.528 * safezoneH + safezoneY;
        	w = 0.185671 * safezoneW;
        	h = 0.055 * safezoneH;
        	colorBackground[] = {0,0,0,0};
          onButtonClick = "call ExileClient_VirtualHanger_network_RetrieveVehicleRequest";
        };
		class enterVehicleName: VirtGarageRscEdit
		{
			idc = 1400;
			x = 0.480312 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.042 * safezoneH;
			text = "";
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0.1};
			onKeyUp = "call ExileClient_VirtualHanger_updateVehicleName";
		};
		class editLabel: VirtGarageRscStructuredText
		{
			idc = 1020;
			text = "Enter Nick Name"; 
			x = 0.39 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.056 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};	
		class displayVehicleName: VirtGarageRscStructuredText
		{
			idc = 1401;
			x = 0.480312 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.18375 * safezoneW;
			h = 0.042 * safezoneH;
			text = "";
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
			//onKeyUp = "call VG_client_update_vehicleName";
		};
		class displayVehiclNameLabel: VirtGarageRscStructuredText
		{
			idc = 1021;
			text = "Nick Name"; 
			x = 0.39 * safezoneW + safezoneX;
			y = 0.486 * safezoneH + safezoneY;
			w = 0.0984375 * safezoneW;
			h = 0.056 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};
		};			
		class selectNickName: VirtGarageRscButton
		{
			idc = 1601;
			text = "Set Vehicle Nickname"; //--- ToDo: Localize;
			x = 0.479375 * safezoneW + safezoneX;
			y = 0.533 * safezoneH + safezoneY;
			w = 0.128906 * safezoneW;
			h = 0.033 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,0};		
			onButtonClick = "call ExileClient_VirtualHanger_setVehicleNickname";	
		};		
    };
};
