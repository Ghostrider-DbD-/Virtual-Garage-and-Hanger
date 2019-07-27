/*
    Name: ExileServer_VirtualGarage_network_setVehicleNicknameRequest
    by Ghostrider-GRG-
    Copyright 2019
    Description: sets a variable with a nickname on the vehicle/object in question 
*/
private _payload = _this;
private _sessionID = (_payload select 0);
private _vehicle = (_payload select 1) select 0;
private _nickname = (payload select 1) select 1;
_vehicle setVariable["GRG_nickName",_nickname,true];
[_sessionID,["setVehiclNicknameResponse",_vehicle,_nickname]] call ExileServer_system_network_send_to;
private _vehicleID = _vehicle getVariable ["ExileDatabaseID", -1];
private _data = [_vehicleID,_nickname];
private _extDB2Message = ["updateVehicle", _data] call ExileServer_util_extDB2_createMessage;
_extDB2Message call ExileServer_system_database_query_fireAndForget;