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
	//diag_log format["VirtualGarage Client: attempted to compile file %1",_file];
}
forEach
[
  ['ExileClient_VirtualGarage_AccessGarage', 'VirtualGarage\Functions\ExileClient_VirtualGarage_AccessGarage.sqf'],
  ['ExileClient_VirtualGarage_GetNearbyVehicles', 'VirtualGarage\Functions\ExileClient_VirtualGarage_GetNearbyVehicles.sqf'],
  ['ExileClient_VirtualGarage_network_GetStoredVehiclesRequest', 'VirtualGarage\Functions\ExileClient_VirtualGarage_network_GetStoredVehiclesRequest.sqf'],
  ['ExileClient_VirtualGarage_network_GetStoredVehiclesResponse', 'VirtualGarage\Functions\ExileClient_VirtualGarage_network_GetStoredVehiclesResponse.sqf'],
  ['ExileClient_VirtualGarage_network_RetrieveVehicleRequest', 'VirtualGarage\Functions\ExileClient_VirtualGarage_network_RetrieveVehicleRequest.sqf'],
  ['ExileClient_VirtualGarage_network_RetrieveVehicleResponse', 'VirtualGarage\Functions\ExileClient_VirtualGarage_network_RetrieveVehicleResponse.sqf'],
  ['ExileClient_VirtualGarage_network_StoreVehicleRequest', 'VirtualGarage\Functions\ExileClient_VirtualGarage_network_StoreVehicleRequest.sqf'],
  ['ExileClient_VirtualGarage_network_StoreVehicleResponse', 'VirtualGarage\Functions\ExileClient_VirtualGarage_network_StoreVehicleResponse.sqf'],
  ['ExileClient_VirtualGarage_onNearByVehiclesListSelChanged', 'VirtualGarage\Functions\ExileClient_VirtualGarage_onNearByVehiclesListSelChanged.sqf'],
  ['ExileClient_VirtualGarage_onStoredVehiclesListSelChanged', 'VirtualGarage\Functions\ExileClient_VirtualGarage_onStoredVehiclesListSelChanged.sqf'],
  ['ExileClient_VirtualGarage_onVirtualGarageDialogLoad', 'VirtualGarage\Functions\ExileClient_VirtualGarage_onVirtualGarageDialogLoad.sqf'],
  ['ExileClient_VirtualGarage_VehicleDraw3DIcon', 'VirtualGarage\Functions\ExileClient_VirtualGarage_VehicleDraw3DIcon.sqf'],
  
  //  Additional Functions for Virtual Hanger
  ['ExileClient_VirtualHanger_GetNearbyVehicles', 'VirtualGarage\Functions\ExileClient_VirtualHanger_GetNearbyVehicles.sqf'],
  ['ExileClient_VirtualHanger_onVirtualHangerDialogLoad', 'VirtualGarage\Functions\ExileClient_VirtualHanger_onVirtualHangerDialogLoad.sqf'],  
  ['ExileClient_VirtualHanger_network_GetStoredVehiclesRequest', 'VirtualGarage\Functions\ExileClient_VirtualHanger_network_GetStoredVehiclesRequest.sqf'],  
  ['ExileClient_VirtualHanger_network_VH_GetStoredVehiclesResponse', 'VirtualGarage\Functions\ExileClient_VirtualHanger_network_VH_GetStoredVehiclesResponse.sqf'],  
  ['ExileClient_VirtualHanger_network_StoreVehicleRequest', 'VirtualGarage\Functions\ExileClient_VirtualHanger_network_StoreVehicleRequest.sqf'],   
  ['ExileClient_VirtualHanger_network_RetrieveVehicleRequest', 'VirtualGarage\Functions\ExileClient_VirtualHanger_network_RetrieveVehicleRequest.sqf'], 
  ['ExileClient_VirtualHanger_onNearByVehiclesListSelChanged', 'VirtualGarage\Functions\ExileClient_VirtualHanger_onNearByVehiclesListSelChanged.sqf'], 
  ['ExileClient_VirtualHanger_onStoredVehiclesListSelChanged', 'VirtualGarage\Functions\ExileClient_VirtualHanger_onStoredVehiclesListSelChanged.sqf'],     //  
  ['ExileClient_VirtualHanger_network_VH_StoreVehicleResponse', 'VirtualGarage\Functions\ExileClient_VirtualHanger_network_VH_StoreVehicleResponse.sqf'],  
  ['ExileClient_VirtualHanger_network_VH_RetrieveVehicleResponse', 'VirtualGarage\Functions\ExileClient_VirtualHanger_network_VH_RetrieveVehicleResponse.sqf'],   
  ['ExileClient_VirtualHanger_AccessHanger', 'VirtualGarage\Functions\ExileClient_VirtualHanger_AccessHanger.sqf']
	
];
