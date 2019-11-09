private _functions = [
    ['ExileServer_VirtualGarage_network_GetStoredVehiclesRequest','VirtualGarage_Server\code\ExileServer_VirtualGarage_network_GetStoredVehiclesRequest.sqf'],
    ['ExileServer_VirtualGarage_network_RetrieveVehicleRequest','VirtualGarage_Server\code\ExileServer_VirtualGarage_network_RetrieveVehicleRequest.sqf'],
    ['ExileServer_VirtualGarage_network_setVehicleNicknameRequest','VirtualGarage_Server\code\ExileServer_VirtualGarage_network_setVehicleNicknameRequest.sqf'],
    ['ExileServer_VirtualGarage_network_SpawnRequestedVehicle','VirtualGarage_Server\code\ExileServer_VirtualGarage_network_SpawnRequestedVehicle.sqf'],
    ['ExileServer_VirtualGarage_network_StoreVehicleRequest','VirtualGarage_Server\code\ExileServer_VirtualGarage_network_StoreVehicleRequest.sqf'],
    ['ExileServer_VirtualGarage_utils_diagLog','VirtualGarage_Server\code\ExileServer_VirtualGarage_utils_diagLog.sqf'],
    ['ExileServer_VirtualHanger_network_VH_GetStoredVehiclesRequest','VirtualGarage_Server\code\ExileServer_VirtualHanger_network_VH_GetStoredVehiclesRequest.sqf'],
    ['ExileServer_VirtualHanger_network_VH_RetrieveVehicleRequest','VirtualGarage_Server\code\ExileServer_VirtualHanger_network_VH_RetrieveVehicleRequest.sqf'],
    ['ExileServer_VirtualHanger_network_VH_setVehicleNicknameRequest','VirtualGarage_Server\code\ExileServer_VirtualHanger_network_VH_setVehicleNicknameRequest.sqf'],    
    ['ExileServer_VirtualHanger_network_VH_SpawnRequestedVehicle','VirtualGarage_Server\code\ExileServer_VirtualHanger_network_VH_SpawnRequestedVehicle.sqf'],
    ['ExileServer_VirtualHanger_network_VH_StoreVehicleRequest','VirtualGarage_Server\code\ExileServer_VirtualHanger_network_VH_StoreVehicleRequest.sqf'],
    ['ExileServer_VirtualBoatRack_network_VBR_GetStoredVehiclesRequest','VirtualGarage_Server\code\ExileServer_VirtualBoatRack_network_VBR_GetStoredVehiclesRequest.sqf'],
    ['ExileServer_VirtualBoatRack_network_VBR_RetrieveVehicleRequest','VirtualGarage_Server\code\ExileServer_VirtualBoatRack_network_VBR_RetrieveVehicleRequest.sqf'],
    ['ExileServer_VirtualBoatRack_network_VBR_setVehicleNicknameRequest','VirtualGarage_Server\code\ExileServer_VirtualBoatRack_network_VBR_setVehicleNicknameRequest.sqf'],    
    ['ExileServer_VirtualBoatRack_network_VBR_SpawnRequestedVehicle','VirtualGarage_Server\code\ExileServer_VirtualBoatRack_network_VBR_SpawnRequestedVehicle.sqf'],
    ['ExileServer_VirtualBoatRack_network_VBR_StoreVehicleRequest','VirtualGarage_Server\code\ExileServer_VirtualBoatRack_network_VBR_StoreVehicleRequest.sqf'],
    ["ExileServer_VirtualGarage_utils_getVehicleWeaponsLoadout","VirtualGarage_Server\code\ExileServer_VirtualGarage_utils_getVehicleWeaponsLoadout.sqf"],
    ["ExileServer_VirtualGarage_utils_setVehicleWeaponsLoadout","VirtualGarage_Server\code\ExileServer_VirtualGarage_utils_setVehicleWeaponsLoadout"]
];
{
	_x params["_function","_file"];
    private _code = compileFinal (preprocessFileLineNumbers _file);
    missionNamespace setVariable [_function, compileFinal preprocessFileLineNumbers _file];
    //diag_log format["VirtualGarage: function %1 compiled",_function];
} forEach  [
    ['ExileServer_VirtualGarage_network_GetStoredVehiclesRequest','VirtualGarage_Server\code\ExileServer_VirtualGarage_network_GetStoredVehiclesRequest.sqf'],
    ['ExileServer_VirtualGarage_network_RetrieveVehicleRequest','VirtualGarage_Server\code\ExileServer_VirtualGarage_network_RetrieveVehicleRequest.sqf'],
    ['ExileServer_VirtualGarage_network_setVehicleNicknameRequest','VirtualGarage_Server\code\ExileServer_VirtualGarage_network_setVehicleNicknameRequest.sqf'],
    ['ExileServer_VirtualGarage_network_SpawnRequestedVehicle','VirtualGarage_Server\code\ExileServer_VirtualGarage_network_SpawnRequestedVehicle.sqf'],
    ['ExileServer_VirtualGarage_network_StoreVehicleRequest','VirtualGarage_Server\code\ExileServer_VirtualGarage_network_StoreVehicleRequest.sqf'],
    ['ExileServer_VirtualGarage_utils_diagLog','VirtualGarage_Server\code\ExileServer_VirtualGarage_utils_diagLog.sqf'],
    ['ExileServer_VirtualHanger_network_VH_GetStoredVehiclesRequest','VirtualGarage_Server\code\ExileServer_VirtualHanger_network_VH_GetStoredVehiclesRequest.sqf'],
    ['ExileServer_VirtualHanger_network_VH_RetrieveVehicleRequest','VirtualGarage_Server\code\ExileServer_VirtualHanger_network_VH_RetrieveVehicleRequest.sqf'],
    ['ExileServer_VirtualHanger_network_VH_setVehicleNicknameRequest','VirtualGarage_Server\code\ExileServer_VirtualHanger_network_VH_setVehicleNicknameRequest.sqf'],    
    ['ExileServer_VirtualHanger_network_VH_SpawnRequestedVehicle','VirtualGarage_Server\code\ExileServer_VirtualHanger_network_VH_SpawnRequestedVehicle.sqf'],
    ['ExileServer_VirtualHanger_network_VH_StoreVehicleRequest','VirtualGarage_Server\code\ExileServer_VirtualHanger_network_VH_StoreVehicleRequest.sqf'],
    ['ExileServer_VirtualBoatRack_network_VBR_GetStoredVehiclesRequest','VirtualGarage_Server\code\ExileServer_VirtualBoatRack_network_VBR_GetStoredVehiclesRequest.sqf'],
    ['ExileServer_VirtualBoatRack_network_VBR_RetrieveVehicleRequest','VirtualGarage_Server\code\ExileServer_VirtualBoatRack_network_VBR_RetrieveVehicleRequest.sqf'],
    ['ExileServer_VirtualBoatRack_network_VBR_setVehicleNicknameRequest','VirtualGarage_Server\code\ExileServer_VirtualBoatRack_network_VBR_setVehicleNicknameRequest.sqf'],    
    ['ExileServer_VirtualBoatRack_network_VBR_SpawnRequestedVehicle','VirtualGarage_Server\code\ExileServer_VirtualBoatRack_network_VBR_SpawnRequestedVehicle.sqf'],
    ['ExileServer_VirtualBoatRack_network_VBR_StoreVehicleRequest','VirtualGarage_Server\code\ExileServer_VirtualBoatRack_network_VBR_StoreVehicleRequest.sqf'],
    ["ExileServer_VirtualGarage_utils_getVehicleWeaponsLoadout","VirtualGarage_Server\code\ExileServer_VirtualGarage_utils_getVehicleWeaponsLoadout.sqf"],
    ["ExileServer_VirtualGarage_utils_setVehicleWeaponsLoadout","VirtualGarage_Server\code\ExileServer_VirtualGarage_utils_setVehicleWeaponsLoadout.sqf"]
];


["Virtual Garage preInit Loaded","PreInit"] call ExileServer_VirtualGarage_utils_diagLog;

