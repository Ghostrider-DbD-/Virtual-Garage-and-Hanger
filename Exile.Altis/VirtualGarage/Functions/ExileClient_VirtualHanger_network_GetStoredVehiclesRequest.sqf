/*

 	Name: ExileClient_VirtualHanger_network_GetStoredVehicles.sqf
 	Author(s): Shix; modified by Ghostrider[GRG]
    Copyright (c) 2016 Shix
 	Description: Sends a network request for stored vehicles
*/
private ["_ownerUID"];

_ownerUID = getPlayerUID player;
["VH_GetStoredVehiclesRequest",[_ownerUID]] call ExileClient_system_network_send;
