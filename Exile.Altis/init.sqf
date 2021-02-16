

/*
	This bit is to compile the code to get / save vehicle loadouts.
	Do not add the lines below if you have already installed Ghosts Rearm/Repair/Refuel script.
*/
if (isServer && isNil "RRR_setVehicleLoadout") then 
{
	compileFinal preprocessFileLineNumbers "addons\RRR_scripts\RRR_getSaveLoadout.sqf";
};

