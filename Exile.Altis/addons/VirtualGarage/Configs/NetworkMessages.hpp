class GetStoredVehiclesRequest
	{
		module = "VirtualGarage";
		parameters[] = {"STRING"};
	};

	class GetStoredVehiclesResponse
	{
		module = "VirtualGarage";
		parameters[] = {"ARRAY"};
	};

	class RetrieveVehicleRequest
	{
		module = "VirtualGarage";
		parameters[] = {"STRING"};
	};
	class RetrieveVehicleResponse
	{
		module = "VirtualGarage";
		parameters[] = {"STRING","STRING"};
	};

	class StoreVehicleRequest
	{
		module = "VirtualGarage";
		parameters[] = {"STRING","STRING","STRING"};
	};

	class StoreVehicleResponse
	{
		module = "VirtualGarage";
		parameters[] = {"STRING"};
	};
	class StoredVehicleCountRequest
	{
		module = "VirtualGarage";
		parameters[] = {"STRING","STRING"};
	};
	class StoredVehicleCountResponse
	{
		module = "VirtualGarage";
		parameters[] = {"STRING","STRING"};
	};	
	class setVehicleNickNameRequest 
	{
		module = "VirtualGarage";
		parameters[] = {"OBJECT","STRING"};
	};
	class setVehicleNicknameResponse 
	{
		module = "VirtualGarage";
		parameters[] = {"ARRAY"};
	};
	// Virtual Hanger Functions
	class VH_GetStoredVehiclesRequest
	{
		module = "VirtualHanger";
		parameters[] = {"STRING"};
	};

	class VH_GetStoredVehiclesResponse
	{
		module = "VirtualHanger";
		parameters[] = {"ARRAY"};
	};

	class VH_RetrieveVehicleRequest
	{
		module = "VirtualHanger";
		parameters[] = {"STRING"};
	};
	class VH_RetrieveVehicleResponse
	{
		module = "VirtualHanger";
		parameters[] = {"STRING","STRING"};
	};

	class VH_StoreVehicleRequest
	{
		module = "VirtualHanger";
		parameters[] = {"STRING","STRING","STRING"};
	};

	class VH_StoreVehicleResponse
	{
		module = "VirtualHanger";
		parameters[] = {"STRING"};
	};

	class VH_setVehicleNicknameResponse 
	{
		module = "VirtualGarage";
		parameters[] = {"ARRAY"};
	};	