class CfgExileCustomCode 
{
	// Man Drones
	ExileServer_object_vehicle_database_load = "GRG_Exile_Server_Overrides\ExileServer_object_vehicle_database_load.sqf";
	ExileServer_object_vehicle_carefulCreateVehicle = "GRG_Exile_Server_Overrides\ExileServer_object_vehicle_carefulCreateVehicle.sqf";

	//  GRG Vehicle Nicknames and store/save ammo
	ExileServer_object_vehicle_database_insert = "GRG_Exile_Server_Overrides\ExileServer_object_vehicle_database_insert.sqf";
	ExileServer_object_vehicle_database_update = "GRG_Exile_Server_Overrides\ExileServer_object_vehicle_database_update.sqf";	
};


class CfgInteractionMenus
{

	#include "addons\VirtualGarage\Configs\Interactions.hpp"
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
};

class CfgNetworkMessages {
	#include "VirtualGarage\Configs\NetworkMessages.hpp"	
};
#include "VirtualGarage\Configs\VG_Settings.hpp"