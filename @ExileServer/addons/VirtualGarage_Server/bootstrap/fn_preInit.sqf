/**
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */

private ['_code', '_function', '_file'];

{
    _code = '';
    _function = _x select 0;
    _file = _x select 1;

    _code = compileFinal (preprocessFileLineNumbers _file);

    missionNamespace setVariable [_function, _code];
    //diag_log format["VirtualGarage: function %1 compiled",_function];
}
forEach
[
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
    ['ExileServer_VirtualBoatRack_network_VBR_StoreVehicleRequest','VirtualGarage_Server\code\ExileServer_VirtualBoatRack_network_VBR_StoreVehicleRequest.sqf']
];

["Virtual Garage preInit Loaded","PreInit"] call ExileServer_VirtualGarage_utils_diagLog;
true
