
	class Laptop
	{
		targetType = 2;
		target = "Exile_Construction_Laptop_Static";

		class Actions
		{
			class CameraSystem: ExileAbstractAction
			{
				title = "CCTV Access";
				condition = "((ExileClientInteractionObject animationPhase 'LaptopLidRotation') >= 0.5)";
				action = "_this call ExileClient_gui_baseCamera_show";
			};
			
			/*
			Be sure to add this
			*/
			class VirtualGarage: ExileAbstractAction
			{
			  title = "Access Virtual Garage";
			  condition = "((ExileClientInteractionObject animationPhase 'LaptopLidRotation') >= 0.5)";
			  action = "call ExileClient_VirtualGarage_AccessGarage";
			};
			/*
			END 
			*/
		};
	};

class CfgNetworkMessages {
	#include "VirtualGarage\Configs\NetworkMessages.hpp"	
};
#include "VirtualGarage\Configs\VG_Settings.hpp"