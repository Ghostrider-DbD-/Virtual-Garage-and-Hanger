
	class VirtualHanger
	{
		targetType = 2;
		target = "Land_JetEngineStarter_01_F";

		class Actions
		{
			class AccessVirtualHanger: ExileAbstractAction
			{
				title = "Access Virtual Hanger";
				condition = "true";
				action = "call ExileClient_VirtualHanger_AccessHanger";
			};
			class SetNickname: ExileAbstractAction 
			{
			  title = "Change Nickname";
			  condition = "true";
			  action = "call ExileClient_Nicknames_ChangeNickname";
			};			
		};
	};

	class VirtualBoatRack 
	{
		targetType = 2;
		target = "Land_Destroyer_01_Boat_Rack_01_F";

		class Actions
		{
			class AccessVirtualBoatRack: ExileAbstractAction
			{
				title = "Access Virtual Boat Rack";
				condition = "true";
				action = "call ExileClient_VirtualBoatRack_AccessBoatRack";
			};
			class SetNickname: ExileAbstractAction 
			{
			  title = "Change Nickname";
			  condition = "true";
			  action = "call ExileClient_Nicknames_ChangeNickname";
			};

		};		
	};