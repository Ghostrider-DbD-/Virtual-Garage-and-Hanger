/*

 	  Name: ExileServer_VirtualHanger_network_VH_GetStoredVehicles.sqf
 	  Author(s): Shix; modified for Virtual Hanger by Ghostrider [GRG]
    Copyright (c) 2016 Shix
    This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
*/
_payload = _this;
_sessionID = (_payload select 0);
_uid = (_payload select 1) select 0;
_StoredVehicles = format ["getStoredVehicles:%1", _uid] call ExileServer_system_database_query_selectFull;
//diag_log format["ExileServer_VirtualHanger_network_VH_GetStoredVehicles:-->>  _StoredVehicles = %1",_StoredVehicles];
[_sessionID,"VH_GetStoredVehiclesResponse",[_StoredVehicles]] call ExileServer_system_network_send_to;
