/*
    Name: ExileServer_VirtualGarage_network_setVehicleNicknameRequest
    by Ghostrider-GRG-
    Copyright 2019
    Description: sets a variable with a nickname on the vehicle/object in question 
*/
//diag_log format["ExileServer_VirtualGarage_network_setVehicleNicknameRequest: _payload = %1",_this];
private _payload = _this;
private _sessionID = (_payload select 0);
private _vehicle = (_payload select 1) select 0;
private _nickname = (_payload select 1) select 1;
_vehicle setVariable["GRG_nickName",_nickname,true];

private _vehicleID = _vehicle getVariable ["ExileDatabaseID", -1];
private _data = [_vehicleID,_nickname];
private _extDB2Message = ["updateVehicle", [_nickname,_vehicleID]] call ExileServer_util_extDB2_createMessage;
//diag_log format["ExileServer_VirtualGarage_network_setVehicleNicknameRequest: _extDB2Message = %1",_extDB2Message];
_extDB2Message call ExileServer_system_database_query_fireAndForget;
//diag_log format["ExileServer_VirtualGarage_network_setVehicleNicknameRequest: database calls executed"];
private _parameters = [_vehicle,_nickname]; // [_vehicle,_nickname];
[_sessionID,"setVehicleNicknameResponse",[true]] call ExileServer_system_network_send_to;
//diag_log format["ExileServer_VirtualGarage_network_setVehicleNicknameRequest: client notified"];