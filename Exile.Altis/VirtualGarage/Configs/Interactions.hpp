
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
		};
	};