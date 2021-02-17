

/*
	This bit is to compile the code to get / save vehicle loadouts.
	Do not add the lines below if you have already installed Ghosts Rearm/Repair/Refuel script.
*/
if (isServer) then // This will always run - it should be bulletproof for now. If you install RRR remove it.
{
	if (isNil "RRR_setVehicleLoadout ") then 
	{
	diag_log format["[RRR] <---> compliling functions at %1",diag_tickTime];
	execVM "addons\RRR_scripts\RRR_getSaveLoadout.sqf";
	diag_log format["[RRR] <---> functions compiled at %1",diag_tickTime];
	};
};

