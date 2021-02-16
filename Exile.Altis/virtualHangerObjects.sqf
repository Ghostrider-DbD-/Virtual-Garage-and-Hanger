/*

    These are some objects I spawn in on Altis to allow users to access the virtual hanger.
    They are provided as an example.
    
*/
private _vehicles = [
// The jetengine starter serves as a portal to the virtual hanger 
// while the helipad as a spawn point.
// run this once in initServer.sqf or init.sqf.
["Land_JetEngineStarter_01_F", [14142.6, 16188.5, 21.6454], [0.466175, -0.884682, 0.00420943], [-0.00399675, 0.00265202, 0.999988], true],
["Land_JetEngineStarter_01_F", [14237.9, 16302.9, 20.5362], [0.466178, -0.884689, 0.00172302], [0.00133688, 0.00265204, 0.999996], true],
["Land_JetEngineStarter_01_F", [14259.9, 16316.9, 20.5087], [0.466179, -0.88469, 0.00114291], [0, 0.00129187, 0.999999], true],
["Land_JetEngineStarter_01_F", [14343.7, 16348.8, 19.929], [0.466172, -0.884657, -0.00813303], [-0.0053265, -0.0119995, 0.999914], true],
["Land_JetEngineStarter_01_F", [14415.4, 16326.7, 20.2969], [0.466172, -0.884073, 0.0331322], [-0.0053265, 0.0346451, 0.999385], true],
["Land_JetEngineStarter_01_F", [14404.5, 16230.2, 19.9183], [0.466178, -0.884691, 0.000559797], [0.00133688, 0.00133721, 0.999998], true],
["Land_HelipadRescue_F", [14430.8, 16260.8, 18.7061], [-0.854035, 0.520119, 0.0100461], [0.00932853, -0.00399649, 0.999949], true],
["Land_HelipadRescue_F", [14389.3, 16285.3, 19.2623], [-0.882192, 0.470489, 0.0194479], [0.0213271, -0.00133657, 0.999772], true],
["Land_HelipadRescue_F", [14340.8, 16302.7, 18.9532], [-0.98715, 0.159793, 0.00138919], [0.00399666, 0.0159976, 0.999864], true],
["Land_HelipadRescue_F", [14267.7, 16291.6, 19.3747], [-0.87312, -0.487482, 0.00478244], [0.00399666, 0.00265202, 0.999988], true],
["Land_HelipadRescue_F", [14246, 16278.7, 19.4808], [0.816728, 0.577001, -0.00493952], [0.00133688, 0.00666817, 0.999977], true],
["Land_JetEngineStarter_01_F", [26786.5, 24652.1, 22.1336], [0.692563, -0.720923, 0.0250264], [0.00133721, 0.0359765, 0.999352], true],
["Land_HelipadRescue_F", [26822.7, 24625.3, 22.4079], [-0.649094, -0.760291, 0.0251972], [0.00133721, 0.031983, 0.999488], true],
["Land_JetEngineStarter_01_F", [11572.7, 11936, 24.8848], [0.466178, -0.884689, 0.00172286], [0.00133721, 0.00265204, 0.999996], true],
["Land_HelipadRescue_F", [11616.5, 11963.5, 23.5642], [0.53745, 0.843286, -0.00399042], [0.0053265, 0.00133719, 0.999985], true],
["Land_HelipadRescue_F", [14192.1, 16183.3, 20.6129], [-0.312499, -0.949855, 0.0109587], [0.00265204, 0.010664, 0.99994], true]
];

{
    private _vehicle = (_x select 0) createVehicle (_x select 1);
    _vehicle allowDamage false;
    _vehicle setPosWorld (_x select 1);
    _vehicle setVectorDirAndUp [_x select 2, _x select 3];
    _vehicle enableSimulationGlobal (_x select 4);
    _vehicle setVariable ["ExileIsLocked", -1, true];
}
forEach _vehicles;


