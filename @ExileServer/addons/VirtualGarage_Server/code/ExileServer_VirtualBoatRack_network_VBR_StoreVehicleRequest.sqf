/*

 	Name: ExileServer_VirtualBoatRack_network_VBR_StoreVehicleRequest.sqf
 	Author(s): Shix; modified for Virtual Boat Rack by Ghostrider [GRG]
  Copyright (c) 2016 Shix
  This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
  To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 	Description: Handles store Vehicle Requests
	
	Modified by GhostriderDbD to store money, textures, inventory and a nickname
*/
//diag_log format["ExileServer_VirtualBoatRack_network_StoreVehicleRequest: calling VirtualGarage Store Function with _this = %1",_this];
_this call ExileServer_VirtualGarage_network_StoreVehicleRequest;

