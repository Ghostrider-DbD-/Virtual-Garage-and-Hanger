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
    missionNamespace setVariable [_function, _code];;
}
forEach
[
  ['ExileClient_VirtualGarage_AccessGarage', 'addons\VirtualGarage\Functions\ExileClient_VirtualGarage_AccessGarage.sqf'],
  ['ExileClient_VirtualGarage_GetNearbyVehicles', 'addons\VirtualGarage\Functions\ExileClient_VirtualGarage_GetNearbyVehicles.sqf'],
  ['ExileClient_VirtualGarage_network_GetStoredVehiclesRequest', 'addons\VirtualGarage\Functions\ExileClient_VirtualGarage_network_GetStoredVehiclesRequest.sqf'],
  ['ExileClient_VirtualGarage_network_GetStoredVehiclesResponse', 'addons\VirtualGarage\Functions\ExileClient_VirtualGarage_network_GetStoredVehiclesResponse.sqf'],
  ['ExileClient_VirtualGarage_network_RetrieveVehicleRequest', 'addons\VirtualGarage\Functions\ExileClient_VirtualGarage_network_RetrieveVehicleRequest.sqf'],
  ['ExileClient_VirtualGarage_network_RetrieveVehicleResponse', 'addons\VirtualGarage\Functions\ExileClient_VirtualGarage_network_RetrieveVehicleResponse.sqf'],
  ['ExileClient_VirtualGarage_network_StoreVehicleRequest', 'addons\VirtualGarage\Functions\ExileClient_VirtualGarage_network_StoreVehicleRequest.sqf'],
  ['ExileClient_VirtualGarage_network_StoreVehicleResponse', 'addons\VirtualGarage\Functions\ExileClient_VirtualGarage_network_StoreVehicleResponse.sqf'],
  ['ExileClient_VirtualGarage_onNearByVehiclesListSelChanged', 'addons\VirtualGarage\Functions\ExileClient_VirtualGarage_onNearByVehiclesListSelChanged.sqf'],
  ['ExileClient_VirtualGarage_onStoredVehiclesListSelChanged', 'addons\VirtualGarage\Functions\ExileClient_VirtualGarage_onStoredVehiclesListSelChanged.sqf'],
  ['ExileClient_VirtualGarage_onVirtualGarageDialogLoad', 'addons\VirtualGarage\Functions\ExileClient_VirtualGarage_onVirtualGarageDialogLoad.sqf'],
  ['ExileClient_VirtualGarage_VehicleDraw3DIcon', 'addons\VirtualGarage\Functions\ExileClient_VirtualGarage_VehicleDraw3DIcon.sqf'],

  ['ExileClient_VirtualGarage_updateVehicleName','addons\VirtualGarage\Functions\ExileClient_VirtualGarage_updateVehicleName.sqf'],
  ['ExileClient_VirturalGarage_hideVehicleNameEditor','addons\VirtualGarage\Functions\ExileClient_VirturalGarage_hideVehicleNameEditor.sqf'],
  ['ExlieClient_VirtualGarage_showVehiclNameEditor','addons\VirtualGarage\Functions\ExlieClient_VirtualGarage_showVehiclNameEditor.sqf'],
  ['ExileClient_VirtualGarage_setVehicleNickname','addons\VirtualGarage\Functions\ExileClient_VirtualGarage_setVehicleNickname.sqf'],
  ['ExileClient_VirtualGarage_network_setVehicleNicknameRequest','addons\VirtualGarage\Functions\ExileClient_VirtualGarage_network_setVehicleNicknameRequest.sqf'],
  ['ExileClient_VirtualGarage_network_setVehicleNicknameResponse','addons\VirtualGarage\Functions\ExileClient_VirtualGarage_network_setVehicleNicknameResponse.sqf'],
  
  //  Additional Functions for Virtual Hanger
  ['ExileClient_VirtualHanger_GetNearbyVehicles', 'addons\VirtualGarage\Functions\ExileClient_VirtualHanger_GetNearbyVehicles.sqf'],
  ['ExileClient_VirtualHanger_onVirtualHangerDialogLoad', 'addons\VirtualGarage\Functions\ExileClient_VirtualHanger_onVirtualHangerDialogLoad.sqf'],  
  ['ExileClient_VirtualHanger_network_GetStoredVehiclesRequest', 'addons\VirtualGarage\Functions\ExileClient_VirtualHanger_network_GetStoredVehiclesRequest.sqf'],  
  ['ExileClient_VirtualHanger_network_VH_GetStoredVehiclesResponse', 'addons\VirtualGarage\Functions\ExileClient_VirtualHanger_network_VH_GetStoredVehiclesResponse.sqf'],  
  ['ExileClient_VirtualHanger_network_StoreVehicleRequest', 'addons\VirtualGarage\Functions\ExileClient_VirtualHanger_network_StoreVehicleRequest.sqf'],   
  ['ExileClient_VirtualHanger_network_RetrieveVehicleRequest', 'addons\VirtualGarage\Functions\ExileClient_VirtualHanger_network_RetrieveVehicleRequest.sqf'], 
  ['ExileClient_VirtualHanger_onNearByVehiclesListSelChanged', 'addons\VirtualGarage\Functions\ExileClient_VirtualHanger_onNearByVehiclesListSelChanged.sqf'], 
  ['ExileClient_VirtualHanger_onStoredVehiclesListSelChanged', 'addons\VirtualGarage\Functions\ExileClient_VirtualHanger_onStoredVehiclesListSelChanged.sqf'],     //  
  ['ExileClient_VirtualHanger_network_VH_StoreVehicleResponse', 'addons\VirtualGarage\Functions\ExileClient_VirtualHanger_network_VH_StoreVehicleResponse.sqf'],  
  ['ExileClient_VirtualHanger_network_VH_RetrieveVehicleResponse', 'addons\VirtualGarage\Functions\ExileClient_VirtualHanger_network_VH_RetrieveVehicleResponse.sqf'],   
  ['ExileClient_VirtualHanger_AccessHanger', 'addons\VirtualGarage\Functions\ExileClient_VirtualHanger_AccessHanger.sqf'],
    
  ['ExileClient_VirtualHanger_updateVehicleName','addons\VirtualGarage\Functions\ExileClient_VirtualHanger_updateVehicleName.sqf'],
  ['ExileClient_VirturalHanger_hideVehicleNameEditor','addons\VirtualGarage\Functions\ExileClient_VirturalHanger_hideVehicleNameEditor.sqf'],
  ['ExlieClient_VirtualHanger_showVehiclNameEditor','addons\VirtualGarage\Functions\ExlieClient_VirtualHanger_showVehiclNameEditor.sqf'],
  ['ExileClient_VirtualHanger_setVehicleNickname','addons\VirtualGarage\Functions\ExileClient_VirtualHanger_setVehicleNickname.sqf'],
  ['ExileClient_VirtualHanger_network_setVehicleNicknameRequest','addons\VirtualGarage\Functions\ExileClient_VirtualHanger_network_setVehicleNicknameRequest.sqf'],
  ['ExileClient_VirtualHanger_network_VH_setVehicleNicknameResponse','addons\VirtualGarage\Functions\ExileClient_VirtualHanger_network_VH_setVehicleNicknameResponse.sqf']
	
];
