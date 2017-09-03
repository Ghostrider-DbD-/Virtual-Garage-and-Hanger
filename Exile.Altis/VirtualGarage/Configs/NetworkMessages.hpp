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
		parameters[] = {"STRING","STRING"};
	};

	class StoreVehicleResponse
	{
		module = "VirtualGarage";
		parameters[] = {"STRING"};
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
		parameters[] = {"STRING","STRING"};
	};

	class VH_StoreVehicleResponse
	{
		module = "VirtualHanger";
		parameters[] = {"STRING"};
	};